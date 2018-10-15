# Runs "sfc /scannow", "dism.exe /online /cleanup-image /CheckHealth", "dism.exe /online
# /cleanup-image /ScanHealth" and if any errors are found in those 3, it runs 
# "dism.exe /online /cleanup-image /startcomponentcleanup" and "dism.exe /online /cleanup-image /restorehealth".


sfc /scannow
dism /online /cleanup-image /CheckHealth
dism /online /cleanup-image /ScanHealth
dism /online /cleanup-image /startcomponentcleanup
dism /online /cleanup-image /restorehealth
