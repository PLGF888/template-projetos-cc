@echo off
chcp 65001 >nul
echo ====================================================
echo 🚀 Setting up Developer Environment...
echo ====================================================

REM Set ExecutionPolicy safely for current user
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"

REM Install Scoop if missing
powershell -Command "if (!(Get-Command scoop -ErrorAction SilentlyContinue)) { irm get.scoop.sh | iex; scoop update } else { Write-Host 'Scoop already installed.' -ForegroundColor Green }"

REM Install Scoop packages
for %%p in (pipx make) do (
    powershell -Command "if (!(scoop list | Select-String '%%p')) { scoop install %%p } else { Write-Host '%%p already installed.' -ForegroundColor Green }"
)

REM Ensure pipx path is configured
powershell -Command "pipx ensurepath"

REM Install pipx Python tools
for %%t in (poetry cookiecutter) do (
    powershell -Command "if (!(pipx list | Select-String '%%t')) { pipx install %%t } else { Write-Host '%%t already installed.' -ForegroundColor Green }"
)

echo ====================================================
powershell -Command "Write-Host 'Configuration Complete!' -ForegroundColor Magenta"
echo ====================================================
pause