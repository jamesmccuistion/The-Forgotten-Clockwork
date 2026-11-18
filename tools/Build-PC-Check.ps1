#requires -version 5.1
$ErrorActionPreference = 'Stop'
$game = 'D:\Steam\steamapps\common\Skyrim Special Edition'
$workspace = Join-Path $env:USERPROFILE 'Documents\ForgottenClockwork-Dev'
$source = Join-Path $workspace 'The-Forgotten-Clockwork-main'
$log = Join-Path $workspace 'Build-Report.txt'
New-Item -ItemType Directory -Path $workspace -Force | Out-Null
$lines = New-Object System.Collections.Generic.List[string]
function Report([string]$message) {
  $lines.Add($message)
  Write-Host $message
}
function Flush { $lines | Set-Content -LiteralPath $log -Encoding UTF8 }
try {
  Report 'THE FORGOTTEN CLOCKWORK - SAFE PAPYRUS BUILD CHECK'
  Report ('Time: ' + (Get-Date).ToString('u'))
  Report ('Game: ' + $game)
  $compiler = Join-Path $game 'Papyrus Compiler\PapyrusCompiler.exe'
  $zip = Join-Path $game 'Data\Scripts.zip'
  if (!(Test-Path -LiteralPath $compiler)) { throw 'PapyrusCompiler.exe missing.' }
  Report 'Compiler found.'
  $download = Join-Path $workspace 'source.zip'
  $url = 'https://github.com/jamesmccuistion/The-Forgotten-Clockwork/archive/refs/heads/main.zip'
  Report 'Downloading source code from GitHub...'
  Invoke-WebRequest -Uri $url -OutFile $download -UseBasicParsing
  if (Test-Path -LiteralPath $source) {
    $source = Join-Path $workspace ('The-Forgotten-Clockwork-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
    New-Item -ItemType Directory -Path $source -Force | Out-Null
    Expand-Archive -LiteralPath $download -DestinationPath $source -Force
    $source = Join-Path $source 'The-Forgotten-Clockwork-main'
  } else {
    Expand-Archive -LiteralPath $download -DestinationPath $workspace -Force
  }
  if (!(Test-Path -LiteralPath (Join-Path $source 'scripts\Source\FC_CityController.psc'))) {
    throw 'GitHub download did not contain expected source files.'
  }
  Report ('Source project: ' + $source)
  $nativeSource = Join-Path $game 'Data\Scripts\Source'
  $include = $nativeSource
  $hasCore = (Test-Path -LiteralPath (Join-Path $nativeSource 'ObjectReference.psc')) -and (Test-Path -LiteralPath (Join-Path $nativeSource 'Quest.psc'))
  if (!$hasCore) {
    if (!(Test-Path -LiteralPath $zip)) { throw 'Native Papyrus source files absent and Scripts.zip missing.' }
    $extract = Join-Path $workspace 'NativeSources'
    Report 'Extracting Bethesda Scripts.zip into separate workspace (not game Data)...'
    Expand-Archive -LiteralPath $zip -DestinationPath $extract -Force
    $core = Get-ChildItem -LiteralPath $extract -Recurse -Filter 'ObjectReference.psc' -File | Select-Object -First 1
    if (!$core) { throw 'Could not find ObjectReference.psc inside Scripts.zip.' }
    $include = $core.DirectoryName
  }
  $flag = Join-Path $nativeSource 'TESV_Papyrus_Flags.flg'
  if (!(Test-Path -LiteralPath $flag)) {
    $otherFlag = Get-ChildItem -LiteralPath $workspace -Recurse -Filter 'TESV_Papyrus_Flags.flg' -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (!$otherFlag) { throw 'Could not locate TESV_Papyrus_Flags.flg' }
    $flag = $otherFlag.FullName
  }
  $include = (Join-Path $source 'scripts\Source') + ';' + $include
  $output = Join-Path $workspace 'Compiled'
  New-Item -ItemType Directory -Path $output -Force | Out-Null
  Report ('Compiler includes: ' + $include)
  Report ('Flags: ' + $flag)
  $failed = 0
  $scripts = Get-ChildItem -LiteralPath (Join-Path $source 'scripts\Source') -Filter '*.psc' -File
  foreach ($f in $scripts) {
    Report ('Compiling ' + $f.Name)
    $args = @($f.FullName, ('-i=' + $include), ('-o=' + $output), ('-f=' + $flag))
    $compilerOutput = & $compiler @args 2>&1 | Out-String
    Report $compilerOutput.Trim()
    $pex = Join-Path $output ($f.BaseName + '.pex')
    if ($LASTEXITCODE -ne 0 -or !(Test-Path -LiteralPath $pex)) {
      $failed++
      Report ('FAIL: ' + $f.Name + ' exit=' + $LASTEXITCODE)
    } else { Report ('PASS: ' + $f.Name) }
  }
  Report ("RESULT: $($scripts.Count - $failed)/$($scripts.Count) scripts compiled.")
  Report ('Nothing has been installed into Skyrim Data.')
} catch {
  Report ('ERROR: ' + $_.Exception.Message)
} finally {
  Flush
  Write-Host ('Report: ' + $log)
}
