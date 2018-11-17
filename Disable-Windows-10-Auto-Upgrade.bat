@ECHO OFF
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableOSUpgrade /d 1 /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\Gwx /v DisableGwx /d 1 /f