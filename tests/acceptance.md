# Release acceptance gates

## Gate A — technical proof
- [ ] Create a minimal CK plugin with correct masters, zero missing masters.
- [ ] Verify clean install/uninstall via Vortex and MO2.
- [ ] First NPC greets player, has routine, survives save/reload.
- [ ] Dialogue changes after one committed player choice.
- [ ] One gate closes and maintenance path opens with reset-proof triggers.
- [ ] Controlled capture enters ward BEFORE player death; avoids equipment/follower loss.
- [ ] Capture can always be exited even after save/reload and skipped scene.
- [ ] Echo can run a deterministic imitation/behavior sequence.

## Gate B — content
- [ ] Each of 13 main quests starts, completes and has fail-safe stage paths.
- [ ] Morrow rescued and lost routes both lead to archive.
- [ ] Three endings work and persist in reopened saves.
- [ ] No forced long unskippable cutscenes.
- [ ] All required dialogue voiced and subtitled with appropriate licensing.
- [ ] Finished meshes, texture variants, rigs and collision inspected in game.
- [ ] All relevant cells navmeshed; companions and AI use doors correctly.
- [ ] Every public release asset is original or redistributable.

## Gate C — compatibility/QA
- [ ] Test SE/AE runtimes supported by packaging.
- [ ] Clean install, existing save, post-quest free roam, and save/load during each chapter.
- [ ] Test stealth, warrior, mage builds; followers, death, sprinting, mounted/fast travel exterior.
- [ ] Test if player leaves city during welcoming stage and returns.
- [ ] Test repeated capture, scene interruption, disabled controls, re-entry, scripted actor death.
- [ ] Verify no arbitrary polling, no log spam, and acceptable FPS in busy plaza.
- [ ] Package Data archive; install with Vortex and MO2; inspect missing scripts/assets.
