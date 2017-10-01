@ECHO OFF
cd /D "%~dp0%"
PowerShell.exe -ExecutionPolicy bypass -Command "& .\Script.ps1"
pause
