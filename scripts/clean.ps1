<# Clean common build/test artifacts from repo
   Removes: __pycache__, .pytest_cache, build, dist, *.pyc
#>
$dirs = Get-ChildItem -Path . -Directory -Recurse -Force -ErrorAction SilentlyContinue | Where-Object { $_.Name -in @('__pycache__', '.pytest_cache', 'build', 'dist') }
foreach ($d in $dirs) {
   try { Remove-Item $d.FullName -Recurse -Force -ErrorAction SilentlyContinue } catch { }
}
Get-ChildItem -Path . -Recurse -Force -Include *.pyc,*.pyo -ErrorAction SilentlyContinue | ForEach-Object { try { Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue } catch { } }
Write-Output "Clean complete."