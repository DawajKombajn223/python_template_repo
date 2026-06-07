Tasks runner

PowerShell (Windows):
- Use the PS wrapper to run tasks: `.
un.ps1 -Task <task>`
- Example: `.
un.ps1 -Task check-format`

Bash (WSL, Git Bash, macOS, Linux):
- Use the bash wrapper: `./run.sh <task>`
- Example: `./run.sh check-format`

Available tasks (both):
- init
- test
- format
- check-format
- lint
- clean

Note: On Windows prefer PowerShell runner. Bash scripts require a bash-compatible shell (WSL or Git Bash).