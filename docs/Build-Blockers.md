# Build blockers and verified status

## Available today
- Public repository and committed design documentation.
- Event-driven Papyrus source scaffolds for city state, dialogue choices, invitation, gate and arrival.
- Static repository consistency checking through GitHub Actions.

## Not available/verified in current environment
- Skyrim Special Edition game data / Creation Kit executable and Papyrus compiler.
- Compiled .esp/.esm worldspaces/quests and associated navmesh, actor forms, dialogue records, and packages.
- Original rigged animations and models, textures, voice and lip-sync.
- In-game captures, save-load compatibility, performance and Vortex/MO2 release tests.

These are necessary prerequisites for a **playable release**. A GitHub-only text source repository cannot substitute for a compiled plugin with CK records. No public release asset should be mislabeled as installable.

## High-risk system choices
1. Capture at player defeat must never be implemented by pretending an OnDeath revive is guaranteed safe.
2. Player face copying is not guaranteed, especially with extensive appearance mods.
3. Custom creature animations require engine-compatible skeleton/behavior testing.
4. Large interactive city requires cell partitioning, navmesh and CPU/script profiling.
5. Full voices require redistribution rights and testing in-game.

## Completion gates
The README and docs describe the target. The checklist in tests/acceptance.md is the condition for release; until the runtime tests pass, release is blocked.
