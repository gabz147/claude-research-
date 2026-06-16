#!/usr/bin/env python3
"""Python operations helpers for claude-research-bot.

Shell remains the process supervisor. This module owns structured repo logic:
task queue operations, validation/evaluator gates, report summaries, Discord
payload formatting, and lightweight research index maintenance.
"""
from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any

TASK_RE = re.compile(r"^TASK-\d{4}$")
QUEUE_STATES = ("pending", "active", "completed", "failed")
STATUS_BY_DIR = {state: state.upper() for state in QUEUE_STATES}
ALLOWED_STATUS_BY_DIR = {
    "pending": {"PENDING"},
    "active": {"ACTIVE"},
    "completed": {"COMPLETED", "DONE"},
    "failed": {"FAILED"},
}
PRIORITIES = {"HIGH", "MED", "LOW"}
CONFIDENCE = {"HIGH", "MED", "MEDIUM", "LOW"}
EFFORT = {"S", "M", "L"}
SECRET_RE = re.compile(r"(?i)(DISCORD_BOT_TOKEN\s*=|api[_-]?key\s*=|password\s*=|secret\s*=|token\s*=)")

CHANNEL_TITLES = {
    "status": "Status Update",
    "research": "Research Update",
    "active": "Active Task",
    "completed": "Task Complete",
    "opportunities": "Opportunity Ledger",
    "alerts": "Operational Alert",
    "daily": "Daily Report",
}
CHANNEL_COLORS = {
    "status": 4456367,
    "research": 5404535,
    "active": 4456367,
    "completed": 4391468,
    "opportunities": 5803266,
    "alerts": 15158332,
    "daily": 5265274,
}


def iso_now() -> str:
    return dt.datetime.now(dt.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def repo_root_from_script() -> Path:
    return Path(__file__).resolve().parents[1]


def atomic_write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, tmp_name = tempfile.mkstemp(prefix=f".{path.name}.", dir=str(path.parent))
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(text)
        os.replace(tmp_name, path)
    finally:
        tmp = Path(tmp_name)
        if tmp.exists():
            tmp.unlink()


def load_json(path: Path) -> Any:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def write_json(path: Path, data: Any) -> None:
    atomic_write(path, json.dumps(data, indent=2, ensure_ascii=False) + "\n")


def log(root: Path, level: str, message: str) -> None:
    line = f"{iso_now()} [{level}] {message}\n"
    log_dir = root / "logs"
    log_dir.mkdir(parents=True, exist_ok=True)
    with (log_dir / "aro.log").open("a", encoding="utf-8") as handle:
        handle.write(line)
    print(line, end="", file=sys.stderr)


def queue_dir(root: Path) -> Path:
    return root / "queue"


def ensure_queue_dirs(root: Path) -> None:
    for state in QUEUE_STATES:
        (queue_dir(root) / state).mkdir(parents=True, exist_ok=True)


def task_files(root: Path, state: str | None = None) -> list[Path]:
    ensure_queue_dirs(root)
    states = [state] if state else list(QUEUE_STATES)
    files: list[Path] = []
    for item in states:
        if item not in QUEUE_STATES:
            raise ValueError(f"bad queue state: {item}")
        files.extend(sorted((queue_dir(root) / item).glob("TASK-*.json")))
    return files


def find_task(root: Path, task_id: str) -> Path | None:
    matches = task_files(root)
    for path in matches:
        if path.stem == task_id:
            return path
    return None


def next_task_id(root: Path) -> str:
    highest = 0
    for path in task_files(root):
        match = re.match(r"TASK-0*(\d+)$", path.stem)
        if match:
            highest = max(highest, int(match.group(1)))
    return f"TASK-{highest + 1:04d}"


def validate_task(path: Path, root: Path) -> list[str]:
    errors: list[str] = []
    try:
        task = load_json(path)
    except Exception as exc:  # noqa: BLE001 - surfaced as validation text
        return [f"{path}: invalid JSON: {exc}"]

    if not isinstance(task, dict):
        return [f"{path}: task JSON must be an object"]

    task_id = task.get("id")
    if not isinstance(task_id, str) or not TASK_RE.match(task_id):
        errors.append(f"{path}: id must match TASK-0000")
    elif path.stem != task_id:
        errors.append(f"{path}: filename does not match id {task_id}")

    state = path.parent.name
    expected_status = STATUS_BY_DIR.get(state)
    allowed_status = ALLOWED_STATUS_BY_DIR.get(state, {expected_status} if expected_status else set())
    if allowed_status and task.get("status") not in allowed_status:
        errors.append(f"{path}: status {task.get('status')!r} does not match queue/{state}")

    if task.get("priority") not in PRIORITIES:
        errors.append(f"{path}: priority must be one of {sorted(PRIORITIES)}")

    for field in ("description", "created", "updated", "owner", "confidence", "effort", "notes"):
        if field not in task:
            errors.append(f"{path}: missing {field}")

    if not isinstance(task.get("dependencies", []), list):
        errors.append(f"{path}: dependencies must be a list")
    if "acceptance" in task and not isinstance(task["acceptance"], list):
        errors.append(f"{path}: acceptance must be a list when present")
    if task.get("confidence") not in CONFIDENCE:
        errors.append(f"{path}: confidence should be one of {sorted(CONFIDENCE)}")
    if task.get("effort") not in EFFORT:
        errors.append(f"{path}: effort should be one of {sorted(EFFORT)}")

    return errors


def queue_validation_errors(root: Path) -> list[str]:
    errors: list[str] = []
    seen: dict[str, Path] = {}
    for path in task_files(root):
        errors.extend(validate_task(path, root))
        task_id = path.stem
        if task_id in seen:
            errors.append(f"duplicate task id {task_id}: {seen[task_id]} and {path}")
        seen[task_id] = path

    state_path = root / "state/current_state.json"
    if state_path.exists():
        try:
            state = load_json(state_path)
        except Exception as exc:  # noqa: BLE001
            errors.append(f"{state_path}: invalid JSON: {exc}")
        else:
            current = state.get("current_task")
            if current and current not in seen:
                errors.append(f"state current_task {current} has no queue file")
            for task_id in state.get("open_tasks", []) or []:
                if task_id not in seen:
                    errors.append(f"state open_tasks references missing {task_id}")
    return errors


def command_task(args: argparse.Namespace) -> int:
    root = args.root
    ensure_queue_dirs(root)
    action = args.task_action

    if action == "new":
        description = " ".join(args.description).strip()
        if not description:
            print("task description required", file=sys.stderr)
            return 1
        task_id = next_task_id(root)
        now = iso_now()
        task = {
            "id": task_id,
            "priority": args.priority,
            "status": "PENDING",
            "description": description,
            "dependencies": [],
            "created": now,
            "updated": now,
            "owner": "Researcher",
            "confidence": "MED",
            "effort": "M",
            "notes": "",
        }
        write_json(queue_dir(root) / "pending" / f"{task_id}.json", task)
        log(root, "INFO", f"task: created {task_id} ({args.priority}) {description}")
        print(task_id)
        return 0

    if action == "list":
        for path in task_files(root, args.state):
            task = load_json(path)
            print(f"[{task.get('priority')}] {task.get('id')} {task.get('status')} — {task.get('description')}")
        return 0

    if action == "show":
        path = find_task(root, args.task_id)
        if not path:
            print("not found", file=sys.stderr)
            return 1
        print(path.read_text(encoding="utf-8"), end="")
        return 0

    if action == "move":
        if args.dest not in QUEUE_STATES:
            print(f"bad state {args.dest}", file=sys.stderr)
            return 1
        path = find_task(root, args.task_id)
        if not path:
            print(f"task not found: {args.task_id}", file=sys.stderr)
            return 1
        task = load_json(path)
        task["status"] = STATUS_BY_DIR[args.dest]
        task["updated"] = iso_now()
        dest = queue_dir(root) / args.dest / path.name
        write_json(dest, task)
        if path != dest:
            path.unlink()
        log(root, "INFO", f"task: moved {args.task_id} -> {args.dest}")
        return 0

    print("usage: task {new|list|move|show}", file=sys.stderr)
    return 1


def git_output(root: Path, *args: str) -> str:
    proc = subprocess.run(["git", "-C", str(root), *args], text=True, capture_output=True, check=False)
    return proc.stdout + proc.stderr


def secret_diff_errors(root: Path) -> list[str]:
    errors: list[str] = []
    for mode, args in {
        "unstaged": ("diff", "--", "."),
        "staged": ("diff", "--cached", "--", "."),
    }.items():
        diff = git_output(root, *args)
        for line in diff.splitlines():
            if line.startswith("+") and not line.startswith("+++") and SECRET_RE.search(line):
                errors.append(f"possible secret in {mode} diff: {line[:160]}")
    return errors


def command_verify_cycle(args: argparse.Namespace) -> int:
    root = args.root
    errors: list[str] = []
    required_json = ["state/current_state.json", "config/config.json", "config/discord.json"]
    required_files = [
        "MISSION.md",
        "STATUS.md",
        "NEXT_ACTION.md",
        "COMPRESSED_CONTEXT.md",
        "TODO.md",
        "REPORT.md",
        "DECISIONS.md",
        "RESEARCH.md",
        "prompts/bootstrap.md",
        "prompts/runtime.md",
    ]

    for rel in required_json:
        path = root / rel
        if not path.exists():
            errors.append(f"missing {rel}")
            continue
        try:
            load_json(path)
        except Exception as exc:  # noqa: BLE001
            errors.append(f"{rel}: invalid JSON: {exc}")

    for rel in required_files:
        path = root / rel
        if not path.is_file() or path.stat().st_size == 0:
            errors.append(f"missing or empty {rel}")

    errors.extend(queue_validation_errors(root))
    errors.extend(secret_diff_errors(root))

    next_action = root / "NEXT_ACTION.md"
    if next_action.exists() and "## Do this next" not in next_action.read_text(encoding="utf-8"):
        errors.append("NEXT_ACTION.md must include '## Do this next'")

    if errors:
        print("verify-cycle: FAIL")
        for error in errors:
            print(f"  - {error}")
        return 1

    print("verify-cycle: PASS")
    print(f"  tasks: {len(task_files(root))}")
    return 0


def truncate(text: str, limit: int) -> str:
    return text if len(text) <= limit else text[: limit - 1] + "…"


def discord_payload(channel: str, message: str, image_name: str = "") -> dict[str, Any]:
    key = channel if channel in CHANNEL_TITLES else "status"
    msg = truncate(message, 6000)
    first, _, rest = msg.partition("\n")
    title = first.strip()
    if not title or len(title) > 140:
        title = CHANNEL_TITLES.get(key, "ARO Update")
    title = truncate(title, 240)

    description_lines: list[str] = []
    for raw in rest.splitlines():
        line = raw.strip()
        if not line:
            continue
        if line.startswith("Next:"):
            line = f"**Next**: {line[5:].strip()}"
        description_lines.append(line)
        if len(description_lines) >= 8:
            break
    description = "\n".join(description_lines).strip() or "Repo-backed autonomous research update."
    embed: dict[str, Any] = {
        "title": title,
        "description": truncate(description, 4000),
        "color": CHANNEL_COLORS.get(key, CHANNEL_COLORS["status"]),
        "footer": {"text": "claude-research-bot • repo remains source of truth"},
        "timestamp": iso_now(),
    }
    if image_name:
        embed["image"] = {"url": f"attachment://{image_name}"}
    return {"embeds": [embed]}


def command_discord_payload(args: argparse.Namespace) -> int:
    message = " ".join(args.message)
    print(json.dumps(discord_payload(args.channel, message, args.image_name), ensure_ascii=False))
    return 0


def queue_counts(root: Path) -> dict[str, int]:
    return {state: len(task_files(root, state)) for state in QUEUE_STATES}


def command_report_summary(args: argparse.Namespace) -> int:
    root = args.root
    state = load_json(root / "state/current_state.json")
    counts = queue_counts(root)
    lines = [
        "# Cycle Summary",
        "",
        f"- Generated: {iso_now()}",
        f"- Objective: {state.get('current_objective', '')}",
        f"- Current task: {state.get('current_task') or 'none'}",
        f"- Next action: {state.get('next_action', '')}",
        f"- Queue: pending={counts['pending']} active={counts['active']} completed={counts['completed']} failed={counts['failed']}",
    ]
    text = "\n".join(lines) + "\n"
    if args.write:
        atomic_write(root / args.write, text)
    else:
        print(text, end="")
    return 0


def command_research_index(args: argparse.Namespace) -> int:
    root = args.root
    research = root / "research"
    entries = []
    for path in sorted(research.glob("*.md")):
        if path.name in {"INDEX.md", "METHODOLOGY.md"}:
            continue
        title = path.stem
        with path.open(encoding="utf-8") as handle:
            for line in handle:
                if line.startswith("# "):
                    title = line[2:].strip()
                    break
        entries.append((path.name, title))
    lines = ["# Research Index", "", f"Generated: {iso_now()}", ""]
    lines.extend(f"- [{title}]({name})" for name, title in entries)
    text = "\n".join(lines) + "\n"
    if args.check:
        existing = (research / "INDEX.md").read_text(encoding="utf-8") if (research / "INDEX.md").exists() else ""
        if existing != text:
            print("research index is stale")
            return 1
        print("research index is current")
        return 0
    atomic_write(research / "INDEX.md", text)
    print("research/INDEX.md updated")
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="claude-research-bot operations")
    parser.add_argument("--root", type=Path, default=repo_root_from_script())
    sub = parser.add_subparsers(dest="command", required=True)

    task = sub.add_parser("task")
    task_sub = task.add_subparsers(dest="task_action", required=True)
    new = task_sub.add_parser("new")
    new.add_argument("priority", choices=sorted(PRIORITIES))
    new.add_argument("description", nargs=argparse.REMAINDER)
    task_sub.add_parser("list").add_argument("state", nargs="?", choices=QUEUE_STATES)
    move = task_sub.add_parser("move")
    move.add_argument("task_id")
    move.add_argument("dest", choices=QUEUE_STATES)
    show = task_sub.add_parser("show")
    show.add_argument("task_id")

    sub.add_parser("verify-cycle")
    payload = sub.add_parser("discord-payload")
    payload.add_argument("channel")
    payload.add_argument("--image-name", default="")
    payload.add_argument("message", nargs=argparse.REMAINDER)

    report = sub.add_parser("report-summary")
    report.add_argument("--write")

    index = sub.add_parser("research-index")
    index.add_argument("--check", action="store_true")
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    args.root = args.root.resolve()
    try:
        if args.command == "task":
            return command_task(args)
        if args.command == "verify-cycle":
            return command_verify_cycle(args)
        if args.command == "discord-payload":
            return command_discord_payload(args)
        if args.command == "report-summary":
            return command_report_summary(args)
        if args.command == "research-index":
            return command_research_index(args)
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        print(f"aro: {exc}", file=sys.stderr)
        return 1
    parser.error("unknown command")
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
