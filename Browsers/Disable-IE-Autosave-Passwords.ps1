# Simple .ps1 script which modifies the registry to disallow IE from auto-saving passwords
# This script does not clear existing entries

New-ItemProperty "hkcu:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "DisablePasswordCaching" -Value 1 -PropertyType "DWord"
