<#
Initializes a Python virtual environment (.venv) and installs runtime and dev dependencies.
Usage: .\scripts\init.ps1
#>
$venv = ".venv"
if (-Not (Test-Path $venv)) {
    python -m venv $venv
    & "$venv\Scripts\python.exe" -m pip install --upgrade pip
}
$python = if (Test-Path "$venv\Scripts\python.exe") { "$venv\Scripts\python.exe" } else { "python" }
& $python -m pip install -r requirements.txt
& $python -m pip install -r requirements-dev.txt
Write-Output "Initialized. To activate run: & $venv\Scripts\Activate.ps1"