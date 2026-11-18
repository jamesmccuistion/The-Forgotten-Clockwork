# Prototype 02 — Hospitality and the repeated day

## Scope
Two new script source modules:
- FC_HospitalityController — records welcome interactions and repeated interactions for scripted conversational variants.
- FC_SecurityController — advances city security via story events and locks a designated gate when containment begins.

## Creation Kit setup
1. Create global variables FC_HospitalityVisits, FC_HospitalityRepeats, FC_CityState. Initialize to 0.
2. Create quests FCQ02, FCQ03, FCQ06. Fill the property bindings on script-attached quest instances.
3. Add 3 welcoming NPCs with daily native AI package schedules (merchant, steward, innkeeper).
4. Add dialogue fragments calling RecordWelcome and RecordRepeatedRoutine after eligible conversations. Use mutually exclusive conditions to prevent accidental repeated triggers on one dialog option.
5. Quest FCQ03 activates after sufficient distinct events. Distinguish *repeatable NPC routine* from true time loop. No global time manipulation.
6. Lock only the chosen entrance door; do not lock the entire city via generic reference scans. Always retain safe emergency exit route in the maintenance network for late-game access.
7. Validate that the script properties and quest stages exist before release.

## Acceptance tests
- Welcome NPC schedules function after save/load.
- Returning to the city before containment is allowed.
- Player sees repeated words/actions without forced cinematic waiting.
- Repeated dialogue reveals clues without spamming stages or repeatedly generating journal notifications.
- Changing security to 2 locks only the intended gate.
- Security state persists across save/load; normal Skyrim systems are not altered.

## Limitations
This is Papyrus *source* and CK assembly guidance, not a plugin or tested AI package.
