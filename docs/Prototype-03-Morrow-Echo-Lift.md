# Prototype 03 — Morrow, Echo and maintenance lift

**Preproduction source:** scripts committed to GitHub; they are not compiled or game-tested.

## Morrow encounter — FCQ04
Quest scripts: FC_MorrowController. Global variables:
- FC_MorrowOutcome (0 unknown / 1 rescued / 2 lost)
- FC_MorrowMemoryIntegrity (0..3)

Run ResolveEncounter(1) only after a successful rescue scene, or ResolveEncounter(2) after the alternate guard outcome. The function is idempotent and deliberately sends both branches to FCQ05. On rescued route: Morrow provides dialogue guidance; on lost route: the archive terminal offers the same essential information.

## Echo — FCQ08 and FCQ11
Quest script: FC_EchoController. Global variables:
- FC_EchoTrust = 0 initially, bounded -3..3
- FC_EchoStability = 1 initially, bounded 0..3
- FC_EchoIndependence = 0 initially, bounded 0..3
- FC_EchoOutcome = 0 initially; resolve to 1 ally, 2 rival or 3 unpredictable independent

Call AdjustTrust, AdjustStability, AdjustIndependence only from authored dialogue and event fragments. DetermineOutcome should not be called before the intended FCQ11 commitment point: it persists the decision and is intentionally final. Actor packages and dialogue conditions must reflect outcome.

## Maintenance lift — FCQ07
Place two separately authored FC_MaintenanceLift activators with destination markers for the outward and inward route, and bind properties. After the player repairs the power, advance quest stage 50. Each activator checks this stage before moving the player. If CK follower travel is used, prefer navmeshed load doors with safe marker transitions rather than blindly moving followers.

## Compatibility concerns
- All scripts must be compiled using CK-supplied sources.
- Properties must refer to real CK records.
- This scaffold does not produce assets, scenes, combat AI or navmeshes.
- Game-side validation must cover save/load, branch loss, unreachable ally, repeat activation, combat, mounted player and follower recovery.
