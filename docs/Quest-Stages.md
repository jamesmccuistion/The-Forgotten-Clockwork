# Main Quest Specifications

**Preproduction only.** These IDs and stages are proposed; Creation Kit quest aliases, conditions, scenes, script properties and objectives do not yet exist. Generic stage maps below are a planning template, not compiled quest records.

## FCQ01 — The Invitation
- Core play: courier letter, exterior ruin, gatekeeper and arrival.
- Critical branch: early exit remains available.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ02 — An Honored Guest
- Core play: inn, shops, tour, citizens and real hospitality.
- Critical branch: dialogue influences trust.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ03 — A Day Worth Repeating
- Core play: observe repeated routines and uncover hospitality directive.
- Critical branch: observation or confrontation changes suspicion.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ04 — The Broken Guest
- Core play: Morrow warns player and guards intervene.
- Critical branch: Morrow rescued/lost; both lead to next quest.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ05 — The Missing Hour
- Core play: recover three memory crystals from Archive.
- Critical branch: stealth, puzzle, combat or repair routes.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ06 — The Voluntary Prison
- Core play: exit sealed and containment revealed.
- Critical branch: confrontation or covert investigation.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ07 — The Way Out
- Core play: restore maintenance lift as Skyrim return route.
- Critical branch: Cogren, Morrow or archive clues.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ08 — The Perfect Double
- Core play: encounter Echo, discover replacement plan.
- Critical branch: help, threaten or avoid Echo.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ09 — Names Beneath the Brass
- Core play: guest ledger, imprisoned and converted consciousnesses.
- Critical branch: release, preserve or abandon selected memories.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ10 — The Living City
- Core play: Midnight Procession and reactive city hazards.
- Critical branch: stealth, combat, sabotage or negotiation.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ11 — The First Free Thought
- Core play: Echo discovers independent consciousness.
- Critical branch: trust and stability govern ally/rival/wildcard.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ12 — The Heart Below
- Core play: reach inventor's throne-city control network.
- Critical branch: multiple routes through defense systems.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## FCQ13 — The Final Performance
- Core play: confront Caldris and choose the city's fate.
- Critical branch: destroy, liberate or control.
- Proposed stages: 0 dormant, 10 start, 20 objective, 30 discovery, 40 choice, 50 choice A, 60 choice B, 90 recovery, 100 complete. The final quest needs an additional third ending branch.
- Invariants: essential objectives remain reachable if an NPC is lost, repeated triggers are idempotent, save/load restores state, actor aliases and linked doors resolve correctly.

## Validation requirements
- Morrow's rescued and lost routes both expose the Memory Archive.
- The containment gate closes only after the narrative commitment; an unlockable maintenance lift gives exterior access.
- The Echo's independence, stability and trust are separately tracked and never forced from a single incidental line.
- All three ending choices must complete and leave a functional postgame state.
- Test quest progression, save/load, follower recovery, ordinary death versus named-city capture, and escape fallbacks.
