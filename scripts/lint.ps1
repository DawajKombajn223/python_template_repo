<# Run pylint over the package and tests #>
$venvPy = ".\.venv\Scripts\python.exe"
if (Test-Path $venvPy) {
	$python = $venvPy
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
	$python = "py"
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
	$python = "python"
} else {
	Write-Error "Python not found. Run .\scripts\init.ps1 or install Python and try again."
	exit 1
}

if (-not (& $python -m pip show pylint 2>$null)) {
	Write-Error "pylint not installed. Install with: & $python -m pip install pylint"
	exit 1
}

& $python -m pylint motivator cli.py tests --disable=C0114,C0115,C0116
