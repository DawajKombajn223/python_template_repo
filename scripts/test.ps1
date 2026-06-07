<# Run test suite using virtualenv python if present #>
$venvPy = ".\.venv\Scripts\python.exe"
$python = if (Test-Path $venvPy) { $venvPy } else { "python" }
<# Run test suite using virtualenv python if present #>
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

try {
	& $python -m pytest -q
} catch {
	Write-Error "Failed to run pytest. Ensure pytest is installed (see scripts/init.ps1)."
	exit 1
}
