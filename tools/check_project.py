from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REQUIRED = [
    "README.md", "docs/Story-Bible.md", "docs/Quest-Stages.md",
    "docs/Systems.md", "docs/City-Layout.md", "docs/Characters.md",
    "docs/Dialogue-Samples.md", "docs/Production-Order.md",
    "scripts/Source/FC_CityController.psc",
    "scripts/Source/FC_PlayerDecisionRecorder.psc",
    "tests/acceptance.md", "release/README.md"
]
missing = [p for p in REQUIRED if not (ROOT / p).is_file()]
for f in REQUIRED:
    print(("MISSING" if f in missing else "OK") + ": " + f)
if missing:
    raise SystemExit(1)
print("Design/source scaffold complete. NOT a playable Skyrim mod.")
