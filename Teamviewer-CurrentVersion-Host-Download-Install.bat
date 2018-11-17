if not exist "C:\Temp" mkdir C:\Temp


if exist "C:\Temp\TeamViewer_Host_Setup.exe" goto UNINSTALLER

bitsadmin  /transfer teamviewer /download  /priority normal https://dl.tvcdn.de/download/TeamViewer_Host_Setup.exe C:\Temp\TeamViewer_Host_Setup.exe


:UNINSTALLER
Taskkill /F /IM TeamViewer.exe
"C:\Program Files\TeamViewer\uninstall.exe" /S
"C:\Program Files (x86)\TeamViewer\uninstall.exe" /S

pause


*Install Teamviewer Host
start C:\Temp\TeamViewer_Host_Setup.exe /S /norestart

call "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"

