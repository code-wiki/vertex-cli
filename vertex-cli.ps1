# Vertex CLI launcher for Windows PowerShell
# Requires: Git Bash or WSL

$ErrorActionPreference = "Stop"

Write-Host "================================" -ForegroundColor Blue
Write-Host "   Vertex CLI - Windows" -ForegroundColor Blue
Write-Host "================================" -ForegroundColor Blue
Write-Host ""

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Check for Git Bash
$GitBash = Get-Command bash -ErrorAction SilentlyContinue
if ($GitBash) {
    Write-Host "Found Git Bash" -ForegroundColor Green
    & bash "$ScriptDir\vertex-cli"
    exit
}

# Check for WSL
$WSL = Get-Command wsl -ErrorAction SilentlyContinue
if ($WSL) {
    Write-Host "Found WSL" -ForegroundColor Green
    & wsl bash "$ScriptDir/vertex-cli"
    exit
}

# No bash found
Write-Host "ERROR: Bash not found" -ForegroundColor Red
Write-Host ""
Write-Host "Please install one of the following:"
Write-Host ""
Write-Host "1. Git Bash: https://git-scm.com/download/win"
Write-Host "2. WSL: Run 'wsl --install' in PowerShell as Administrator"
Write-Host ""
pause
exit 1
