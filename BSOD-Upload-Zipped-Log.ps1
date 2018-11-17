# Upload BSOD Minidump.zip to Dropbox
# NOTES: This uploads to a standalone Dropbox Free account with just the BSOD Zipped Logs in it.
#        Simply create an API Token in Dropbox and paste it below INSIDE the quotes for "$Token"

$SourceFilePath = "C:\Temp\$env:computername.zip"

$TargetFilePath = "/Ninja Reports/BSOD Reports/$env:computername.zip"

$Token = "abcdefghijklmnopqrstuvwxyz1234567890"


$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + ($token)

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')

Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers