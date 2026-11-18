"""Basic source-only validation; cannot compile or validate Creation Kit properties."""
from pathlib import Path
import re
root = Path(__file__).resolve().parents[1]
folder = root / "scripts" / "Source"
scripts = sorted(folder.glob("*.psc"))
if not scripts:
    raise SystemExit("No Papyrus scripts found")
for p in scripts:
    text = p.read_text(encoding="utf-8")
    match = re.search(r"^Scriptname\s+(\w+)\s+extends\s+(\w+)\s*$", text, flags=re.I | re.M)
    if not match:
        raise SystemExit(f"Missing Scriptname declaration: {p}")
    if match.group(1).lower() != p.stem.lower():
        raise SystemExit(f"Script name / file mismatch: {p}")
    for a,b in [("Function", "EndFunction"), ("Event", "EndEvent")]:
        starts = len(re.findall(rf"^\s*(?:\w+\s+)?{a}\b", text, re.I | re.M))
        ends = len(re.findall(rf"^\s*{b}\s*$", text, re.I | re.M))
        if starts != ends:
            raise SystemExit(f"{p.name}: {a} starts {starts}, endings {ends}")
    print(f"OK {p.name}")
print("Source shape checks passed. This is NOT a Papyrus compilation.")
