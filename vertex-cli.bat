@echo off
REM Vertex CLI launcher for Windows
REM This script runs vertex-cli in Git Bash or WSL

setlocal enabledelayedexpansion

echo ================================
echo    Vertex CLI - Windows
echo ================================
echo.

REM Check for Git Bash
where bash >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Found Git Bash
    bash "%~dp0vertex-cli"
    goto :end
)

REM Check for WSL
where wsl >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Found WSL
    wsl bash "%~dp0vertex-cli"
    goto :end
)

REM No bash found
echo ERROR: Bash not found
echo.
echo Please install one of the following:
echo.
echo 1. Git Bash: https://git-scm.com/download/win
echo 2. WSL: Run 'wsl --install' in PowerShell as Administrator
echo.
pause
exit /b 1

:end
endlocal
