@ECHO OFF
REM Batch file for run powershell script bypass any ExecutionPolicy

color 74
cd /D "%~dp0%"
PowerShell.exe -ExecutionPolicy bypass -Command "& .\Script.ps1"
pause