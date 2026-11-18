#requires -version 5.1
$ErrorActionPreference = 'Stop'
$game = 'D:\Steam\steamapps\common\Skyrim Special Edition'
$workspace = Join-Path $env:USERPROFILE 'Documents\ForgottenClockwork-Dev'
$log = Join-Path $workspace 'Build-Report.txt'
New-Item -ItemType Directory -Path $workspace -Force | Out-Null
$lines = New-Object 'System.Collections.Generic.List[string]'
function Report([string]$message) { $lines.Add($message); Write-Host $message }
try {
  Report 'THE FORGOTTEN CLOCKWORK - SAFE PAPYRUS BUILD CHECK v2'
  Report ('Time: ' + (Get-Date).ToString('u'))
  Report ('Game: ' + $game)
  $compiler = Join-Path $game 'Papyrus Compiler\PapyrusCompiler.exe'
  $archive = Join-Path $game 'Data\Scripts.zip'
  if (!(Test-Path -LiteralPath $compiler)) { throw 'Missing official Papyrus compiler.' }
  if (!(Test-Path -LiteralPath $archive)) { throw 'Missing Creation Kit Data\Scripts.zip.' }
  $run = Join-Path $workspace ('Run-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
  New-Item -Path $run -ItemType Directory -Force | Out-Null
  $download = Join-Path $run 'project.zip'
  Report 'Downloading latest public GitHub source...'
  Invoke-WebRequest -Uri 'https://github.com/jamesmccuistion/The-Forgotten-Clockwork/archive/refs/heads/main.zip' -OutFile $download -UseBasicParsing
  Expand-Archive -LiteralPath $download -DestinationPath (Join-Path $run 'Project') -Force
  $project = Join-Path $run 'Project\The-Forgotten-Clockwork-main'
  $scripts = @(Get-ChildItem -LiteralPath (Join-Path $project 'scripts\Source') -Filter '*.psc' -File)
  if ($scripts.Count -eq 0) { throw 'Source archive contained no .psc scripts.' }
  Report ('Source files found: ' + $scripts.Count)
  # Always extract the complete Creation Kit Scripts.zip, even if an older
  # Data\Scripts\Source folder appears to contain ObjectReference.psc.
  $extracted = Join-Path $run 'BethesdaSources'
  Report 'Extracting Bethesda Scripts.zip into isolated workspace...'
  Expand-Archive -LiteralPath $archive -DestinationPath $extracted -Force
  $core = @(Get-ChildItem -LiteralPath $extracted -Recurse -Filter 'ObjectReference.psc' -File)
  $locationTypes = @(Get-ChildItem -LiteralPath $extracted -Recurse -Filter 'LocationRefType.psc' -File)
  Report ('ObjectReference sources found: ' + $core.Count)
  Report ('LocationRefType sources found: ' + $locationTypes.Count)
  if ($core.Count -eq 0) { throw 'Scripts.zip does not contain ObjectReference.psc. Check CK installation.' }
  $native = $core[0].DirectoryName
  if (!(Test-Path -LiteralPath (Join-Path $native 'Quest.psc'))) { throw 'Script archive core folder lacks Quest.psc.' }
  if ($locationTypes.Count -eq 0) {
    # Newer CK builds may place sources under Data\Source\Scripts.
    $alternate = Join-Path $game 'Data\Source\Scripts'
    if (Test-Path -LiteralPath (Join-Path $alternate 'LocationRefType.psc')) {
      $includeDirs = @((Join-Path $project 'scripts\Source'), $native, $alternate)
      Report 'Using alternate LocationRefType.psc in Data\Source\Scripts.'
    } else {
      Report 'ERROR: Missing LocationRefType.psc from Scripts.zip and Data\Source\Scripts.'
      Report 'Avoid mixing incomplete old Data\Scripts\Source files with CK sources.'
      throw 'Creation Kit source archive is incomplete. Need source-folder diagnostic.'
    }
  } else {
    $includeDirs = @((Join-Path $project 'scripts\Source'), $native)
    if ($locationTypes[0].DirectoryName -ne $native) {
      $includeDirs += $locationTypes[0].DirectoryName
    }
  }
  $flags = @(Get-ChildItem -LiteralPath $extracted -Recurse -Filter 'TESV_Papyrus_Flags.flg' -File)
  if ($flags.Count -gt 0) {
    $flag = $flags[0].FullName
  } else {
    $flag = Join-Path $game 'Data\Scripts\Source\TESV_Papyrus_Flags.flg'
  }
  if (!(Test-Path -LiteralPath $flag)) { throw 'TESV_Papyrus_Flags.flg missing.' }
  $include = $includeDirs -join ';'
  $output = Join-Path $run 'Compiled'
  New-Item -ItemType Directory -Path $output -Force | Out-Null
  Report ('Include paths: ' + $include)
  Report ('Flags: ' + $flag)
  Report ('Output: ' + $output)
  $fail = 0
  foreach ($file in $scripts) {
    Report ('---- ' + $file.Name + ' ----')
    $args = @($file.FullName, ('-i=' + $include), ('-o=' + $output), ('-f=' + $flag))
    # Windows PowerShell 5.1 can turn native STDERR into a terminating error
    # under ErrorActionPreference Stop. Capture it without aborting the loop.
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
      $messages = & $compiler @args 2>&1 | Out-String
      $exit = $LASTEXITCODE
    } finally { $ErrorActionPreference = $oldPreference }
    Report ($messages.Trim())
    $target = Join-Path $output ($file.BaseName + '.pex')
    if ($exit -ne 0 -or !(Test-Path -LiteralPath $target)) {
      $fail++
      Report ('FAIL ' + $file.Name + ' exit=' + $exit)
    } else {
      Report ('PASS ' + $file.Name)
    }
  }
  Report ('RESULT: ' + ($scripts.Count - $fail) + '/' + $scripts.Count + ' scripts compiled.')
  Report 'Game Data directory was not modified.'
} catch {
  Report ('ERROR: ' + $_.Exception.Message)
} finally {
  $lines | Set-Content -LiteralPath $log -Encoding UTF8
  Write-Host ('Report: ' + $log)
}
