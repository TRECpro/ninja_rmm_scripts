## Used to disable SMBv1, this should be ran on demand or immediately in most case to assure SMBv1 is disabled ##

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 –Force
