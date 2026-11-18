# Gameplay systems and invariants

## Central state
FC_CityState = 0 Welcoming, 1 Watched, 2 Containment, 3 Awakened, 4 Postgame.
State changes triggered by quest milestones/events rather than elapsed global time. Global variables are persisted by Skyrim saves and must have CK-editor defaults.

## Citizens
Native AI packages plus condition checks for trust and quest phase. Dialogue scenes with queued/controlled use of actor aliases. Track persistent quest-defining events rather than every generic brawl.

## Captures
Only designated city captors. Intercept **before death** using validated safe mechanism; do not use OnDeath to resurrect player. Enforce single capture in flight, cooldown, inventory preservation, follower holding, scene-skip fallback, re-enable controls, and emergency exit. Environmental death and outside Skyrim enemies behave normally. Mark a staged prototype as mandatory before claiming capture works.

## Echo
Use authored Gen III mechanical actor, player-appropriate equipment visual approximation and selected movement mirroring; exact modded face/armor copying is NOT promised. Trust, Stability, Independence govern outcomes, with save-safe bounded state transitions.

## Adaptive encounters
Provide Warrior, Mage, Stealth, Repair, and Negotiation route where narratively meaningful; not every encounter must offer all five. Every essential puzzle must have an alternative or documented recovery path.

## Endings
FCQ13 locks one of three endings, updates postgame factions/AI packages and access, and disables mutually exclusive paths. Do not remove unrelated Skyrim spells, items, or faction membership.

## Accessibility
Spoken essential dialogue with subtitles, dialogue replay via journals where feasible, optional skip for timed capture sequences, distinct audio cues, and avoidance of unskippable cinematics.
