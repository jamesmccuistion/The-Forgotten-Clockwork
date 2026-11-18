# One-click local Papyrus compiler check

Run tools/Run-PC-Build-Check.bat on the Windows PC that has Skyrim SE and Creation Kit installed (tested path expected: D:\Steam\steamapps\common\Skyrim Special Edition). It downloads the public GitHub repository ZIP and attempts to compile each Papyrus source file using the official local compiler. Outputs go to Documents\ForgottenClockwork-Dev\Compiled, with a Build-Report.txt containing errors.

**Safety:** does not touch game Data, does not install a plugin, does not run Skyrim. It extracts Bethesda source scripts to a separate workspace when necessary. It accesses only the named public repository download URL. No game binaries or copyrighted data are uploaded. Because the Skyrim compiler cannot run in this chat's environment, this script has not been validated on the user's Windows machine. Verify the report.

Compiled .pex alone is not a playable mod: CK quest records, actors, cells, navmesh and assets are still required.
