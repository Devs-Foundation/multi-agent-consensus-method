@echo off
REM Run the brain sync when the app/machine starts (Windows).
cd /d "%~dp0.."
git pull --rebase --autostash origin master
git push origin HEAD:master
