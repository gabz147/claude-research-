import importlib.util
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("aro", ROOT / "scripts" / "aro.py")
aro = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(aro)


def make_repo(tmp: Path) -> None:
    for rel in [
        "queue/pending",
        "queue/active",
        "queue/completed",
        "queue/failed",
        "state",
        "config",
        "prompts",
        "research",
        "logs",
    ]:
        (tmp / rel).mkdir(parents=True, exist_ok=True)
    for rel in ["MISSION.md", "STATUS.md", "NEXT_ACTION.md", "COMPRESSED_CONTEXT.md", "TODO.md", "REPORT.md", "DECISIONS.md", "RESEARCH.md"]:
        (tmp / rel).write_text("## Do this next\n" if rel == "NEXT_ACTION.md" else "x\n")
    (tmp / "prompts/bootstrap.md").write_text("bootstrap\n")
    (tmp / "prompts/runtime.md").write_text("runtime\n")
    (tmp / "state/current_state.json").write_text(json.dumps({"current_task": None, "open_tasks": [], "next_action": "test"}) + "\n")
    (tmp / "config/config.json").write_text("{}\n")
    (tmp / "config/discord.json").write_text("{}\n")
    subprocess.run(["git", "init"], cwd=tmp, check=True, stdout=subprocess.DEVNULL)


class AroOpsTests(unittest.TestCase):
    def test_task_lifecycle(self):
        with tempfile.TemporaryDirectory() as name:
            root = Path(name)
            make_repo(root)
            self.assertEqual(aro.main(["--root", str(root), "task", "new", "HIGH", "Test task"]), 0)
            task_path = root / "queue/pending/TASK-0001.json"
            self.assertTrue(task_path.exists())
            self.assertEqual(aro.main(["--root", str(root), "task", "move", "TASK-0001", "active"]), 0)
            self.assertFalse(task_path.exists())
            active = json.loads((root / "queue/active/TASK-0001.json").read_text())
            self.assertEqual(active["status"], "ACTIVE")

    def test_verify_cycle_passes_for_valid_repo(self):
        with tempfile.TemporaryDirectory() as name:
            root = Path(name)
            make_repo(root)
            self.assertEqual(aro.main(["--root", str(root), "task", "new", "MED", "Validate me"]), 0)
            state = json.loads((root / "state/current_state.json").read_text())
            state["open_tasks"] = ["TASK-0001"]
            (root / "state/current_state.json").write_text(json.dumps(state) + "\n")
            self.assertEqual(aro.command_verify_cycle(type("Args", (), {"root": root})()), 0)

    def test_queue_validation_catches_status_mismatch(self):
        with tempfile.TemporaryDirectory() as name:
            root = Path(name)
            make_repo(root)
            bad = {
                "id": "TASK-0001",
                "priority": "HIGH",
                "status": "COMPLETED",
                "description": "bad",
                "dependencies": [],
                "created": "now",
                "updated": "now",
                "owner": "Tester",
                "confidence": "HIGH",
                "effort": "S",
                "notes": "",
            }
            (root / "queue/pending/TASK-0001.json").write_text(json.dumps(bad) + "\n")
            errors = aro.queue_validation_errors(root)
            self.assertTrue(any("does not match queue/pending" in err for err in errors))

    def test_discord_payload_formats_next_line(self):
        payload = aro.discord_payload("status", "Cycle done\nNext: run verifier")
        embed = payload["embeds"][0]
        self.assertEqual(embed["title"], "Cycle done")
        self.assertIn("**Next**: run verifier", embed["description"])

    def test_research_index_writes_markdown_index(self):
        with tempfile.TemporaryDirectory() as name:
            root = Path(name)
            make_repo(root)
            (root / "research/TASK-0001-demo.md").write_text("# Demo Finding\n")
            args = type("Args", (), {"root": root, "check": False})()
            self.assertEqual(aro.command_research_index(args), 0)
            self.assertIn("Demo Finding", (root / "research/INDEX.md").read_text())


if __name__ == "__main__":
    unittest.main()
