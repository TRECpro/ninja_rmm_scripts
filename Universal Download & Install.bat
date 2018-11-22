@echo off
REM Just search this script for "FILE.exe" and replace with a familiar name for your installer. Then, change "[PATH-TO-HOSTED-FILE]" with your direct download link (be sure to remove the brackets. If using an MSI installer, remove the REM from the line with "msiexec.exe" and add the REM before the proceeding line. If --For looks, you can rename the "PROGRAM" at the bottom to show the actual program name.


@echo ---Creating Local Directory....
@echo off
if not exist "C:\Temp" mkdir C:\Temp


if exist "C:\Temp\FILE.exe" goto INSTALL


@echo ---Downloading installer file....
@echo off
bitsadmin  /transfer Program Installer  /download  /priority normal [PATH-TO-HOSTED-FILE] C:\Temp\FILE.exe


:INSTALL
@echo Calling the installer....
@echo off
start /wait C:\Temp\FILE.exe /s
REM start /wait msiexec.exe /i C:\Temp\FILE.msi /QN


@echo Installing PROGRAM....