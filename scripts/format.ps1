<# Format codebase using Black (# requires black installed) #>
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

if (-not (& $python -m pip show black 2>$null)) {
	Write-Error "black not installed. Install with: & $python -m pip install black"
	exit 1
}

& $python -m black .
