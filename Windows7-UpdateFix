# Stops required services, renames Windows update folders for rebuild, and starts services automatically
# Run as SYSTEM and on and On-Demand basis

net stop cryptSvc
net stop wuauserv
net stop msiserver
net stop bits
ren C:\Windows\System32\catroot2 catroot2.old
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
net start cryptSvc
net start wuauserv
net start msiserver
net start bits
