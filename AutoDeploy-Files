## Cleans Directory before script runs ##

Remove-Item c:\tools\*.*

## Download deployment tools from internet based file repo (filecloud, dropbox, S3, etc) ##
## URL = internet accessible address for downloads ##
## Output = local destination ##

$url = "http://aplg8.net/repo/aistools.zip"
$output = "c:\tools\ais-tools.zip"
$start_time = Get-Date

Import-Module BitsTransfer

Start-BitsTransfer -Source $url -Destination $output

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

## Extracts aistools.zip to c:\tools\ais-tools\* ##

expand-archive -path 'C:\tools\ais-tools.zip' -destinationpath 'C:\tools\ ' -Force


## Cleans up downloaded .zip file ##

Remove-Item c:\system\*.zip
