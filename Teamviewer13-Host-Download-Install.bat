if not exist "C:\Temp" mkdir C:\Temp


del "C:\Temp\TeamViewer_Host_Setup.exe"
if exist "C:\Temp\TeamViewer13_Host_Setup.exe" goto UNINSTALLER

bitsadmin  /transfer teamviewer /download  /priority normal https://dl.tvcdn.de/download/version_13x/TeamViewer_Host_Setup.exe C:\Temp\TeamViewer13_Host_Setup.exe


:UNINSTALLER
Taskkill /F /IM TeamViewer.exe
"C:\Program Files\TeamViewer\uninstall.exe" /S
"C:\Program Files (x86)\TeamViewer\uninstall.exe" /S

pause


*Install Teamviewer Host
start C:\Temp\TeamViewer13_Host_Setup.exe /S /norestart

call "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"

