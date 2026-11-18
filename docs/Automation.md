# Automated progress without fake claims

The GitHub Actions workflow `.github/workflows/continuous-project-check.yml` checks source files on every main-branch push, through manual dispatch, and daily by schedule. It reports failures as a deduplicated GitHub issue. It does not produce new quests on its own and cannot run the Skyrim Creation Kit or test the game in the cloud.

## Why not an auto-clicking ChatGPT bot?
A browser clicker cannot guarantee an active authenticated ChatGPT session, tool permissions, or reliable completion. Autocontinuation by sending prompts is not a substitute for building, compiling and testing a real mod.

## Engineering loop
1. Source changes committed.
2. GitHub Actions checks structure, declarations and design contract.
3. Failures result in an issue requiring corrective changes.
4. Runtime code and CK records must be assembled/compiled in a Windows environment with licensed game data.
5. In-game QA gates must pass before publishing a release.

This setup automates monitoring and regression checks, not autonomous AI game development.
