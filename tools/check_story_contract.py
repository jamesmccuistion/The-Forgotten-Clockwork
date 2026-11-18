"""Checks completeness of planning files; not a Skyrim runtime test."""
from pathlib import Path
root = Path(__file__).resolve().parents[1]
q = (root / "docs/Quest-Stages.md").read_text(encoding="utf-8")
for n in range(1, 14):
    key = f"FCQ{n:02d}"
    if key not in q:
        raise SystemExit(f"Missing quest contract: {key}")
for path, terms in {
    "docs/Story-Bible.md": ("Morrow", "Echo", "Caldris", "destroy", "liberate", "control"),
    "docs/Systems.md": ("Captures", "Echo", "Endings"),
    "docs/City-Layout.md": ("Grand Approach", "Memory Archive", "Assembly Quarter", "Heart Below")
}.items():
    text = (root / path).read_text(encoding="utf-8").lower()
    for term in terms:
        if term.lower() not in text:
            raise SystemExit(f"{path}: missing design term {term}")
print("All 13 quest contract headings and required design terms found.")
