# Create .zip of BSOD Minidump folder
# NOTES: Simply schedule this to run on NinjaRMM under "Conditions" for "Windows Event" "Source=BugCheck" "Event-IDs=6008,1003,1001".
#        It will create a zip named after the ComputerName and put it in "C:\Temp". Can also be combined with the "Upload-Zipped-BSOD-Log.ps1"
#        to automatically upload to Dropbox for easier access.

$source = "C:\Windows\Minidump"

$destination = "C:\Temp\$env:computername.zip"

$folder = "C:\Temp"

New-Item $folder -type directory -force

If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination)