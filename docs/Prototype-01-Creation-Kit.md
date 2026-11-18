# Prototype 01 — The Invitation

Status: editor recipe and uncompiled Papyrus scripts. No ESP or playable mod yet.

## Contract
- Book: FC_InvitationLetter.
- Quests: FCQ01 (invitation) and FCQ02 (welcoming).
- Gate activator: FC_GateActivator.
- Gatekeeper: FC_Gatekeeper.
- New interior cell: FC_GrandApproach01.
- Exterior entrance and return door: place in tested, non-conflicting position in Skyrim worldspace.
- CK quest stages: FCQ01 10 (received), 20 (read invitation), 30 (find entrance), 40 (speak to gatekeeper), 50 (gatekeeper accepts), 60 (welcome cinematic), 100 (arrived, complete). FCQ02 10 (begins).
- Stage advancement must be triggered by events/dialogue and never by polling every frame.

## CK implementation
1. Create and save ForgottenClockwork.esp with compatible Skyrim SE base masters.
2. Author FCQ01 and FCQ02 quest records, objectives and journal text. Stage 20 displays Find the entrance; 40 displays Speak to the gatekeeper; 50 displays Enter Veyrhold; 100 completes. Add stage 50 dialogue fragment to the gatekeeper's acceptance conversation.
3. Author original letter as book form. Attach FC_InvitationOnRead to the placed reference or a properly filled quest reference alias that receives OnRead; bind FCQ01. Verify event fires after delivery, including inventory read. An alternative robust approach is quest-alias script with OnRead routed through verified alias events.
4. Create exterior ruin entrance in an inspected location with no conflicting worldspace references. Add gatekeeper, gate activator, entrance door, and map marker. Bind FC_GateOnActivate properties. Gatekeeper dialogue must be conditioned on quest stages.
5. Author FC_GrandApproach01 with safe navmesh and return door. Place trigger box and bind FC_ArrivalTrigger to the two quests.
6. Add a courier delivery setup or alias-driven letter distribution as a separate isolated quest. A manual debug give-letter procedure is acceptable **only for internal testing**, never the final player experience.
7. Add fallback if gatekeeper dies or cannot speak: special entrance activation after player has the letter can advance stage 50. Ensure no permanent barrier or missing objective.
8. Compile scripts against actual installed Skyrim SE Papyrus sources. Fix compiler and property-attachment errors. Test save/load, early return from city, letter reread, sprint into trigger, follower traversal and load-door transitions.

## Critical design note
Activating the gate in the provided scaffold advances only to 40. The gatekeeper dialogue must advance to 50; arrival trigger only completes 01 after 50. This prevents bypassing the first welcome dialogue. Place doors and triggers in CK or neither script will run.

## Acceptance
- Courier delivers a unique invitation under standard world conditions.
- Reading the invitation starts FCQ01 only once.
- Valid exterior map marker locates the entrance.
- The gatekeeper speaks and accepts the invitation.
- The return door works until later containment quest.
- FCQ01 completes on player arrival and FCQ02 begins.
- Save/load at every stage is stable.
- No required file absent; deploy as Vortex/MO2 archive only after in-game validation.
