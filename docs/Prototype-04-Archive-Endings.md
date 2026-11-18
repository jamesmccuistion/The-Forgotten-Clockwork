# Prototype 04 — The Archive and the final choice

## FCQ05 — Three memory records
FC_ArchiveController uses a 0..7 record bitmask. The player can collect records in any order. Record indices 1, 2, 3 represent unique archive sources. Re-reading a record is idempotent. Collecting all three moves FCQ05 to stage 50. Essential clues must remain available regardless of Morrow's survival.

CK setup: add FC_ArchiveRecords global initialized to 0; attach controller to FCQ05; fill all properties; call DiscoverRecord from unique archive activators or conversation fragments. Add an authored recovery path for any destroyed or inaccessible reference.

## FCQ13 — Three endings
FC_EndingController persists one final ending (1 = destroy, 2 = liberate, 3 = control). Only the first commitment succeeds. Quest stages 50, 60, 70 distinguish branches. The final quest stage 100 should be authored with appropriate quest fragment after the branch-specific consequences finish. Every ending keeps a safe exit available.

## In-game release gates
- Save/load at each discovery and after each ending.
- Morrow rescued/lost both allow three records.
- Repeated record activations do not duplicate stages.
- Cannot overwrite a committed ending.
- Every ending permits returning to the Skyrim world.
- Inactive ending references and packages are disabled or conditioned cleanly.

All code here is an uncompiled script scaffold until validated by the user's CK/Papyrus compiler.
