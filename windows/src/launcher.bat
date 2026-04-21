@echo off
echo Starting Windows Setup...

powershell.exe -NoProfile -ExecutionPolicy Bypass -file "%~dp0bootstrap.ps1"

pause