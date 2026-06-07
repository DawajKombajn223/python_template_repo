<#
Run helper for tasks. Usage:
  .\scripts\run.ps1 -Task check-format
Available tasks: init, test, format, check-format, lint, clean
#>
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('init','test','format','check-format','lint','clean')]
    [string]$Task
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$target = Join-Path $scriptDir ($Task + ".ps1")
if (-Not (Test-Path $target)) {
    Write-Error "Task script not found: $target"
    exit 1
}

Write-Output "Running $Task -> $target"
& powershell -NoProfile -ExecutionPolicy Bypass -File $target; $LASTEXITCODE
exit $LASTEXITCODE
