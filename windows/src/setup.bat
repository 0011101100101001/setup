@echo off
echo Starting Windows Setup...

powershell.exe -NoProfile -ExecutionPolicy Bypass -file "%~dp0setup.ps1"

pause
