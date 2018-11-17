net stop wuauserv

del C:\Windows\SoftwareDistribution\Download\*.*

del C:\Windows\SoftwareDistribution\DataStore\*.*

net start wuauserv