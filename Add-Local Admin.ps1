##wrote by jgerman03 - use this script to create a new user account, set as a local administrator, with password, and hidden from login (if needed) ##

## Change the following as needed "username" and "password" ##
## Run this schedule on demand or a scheduled basis within NinjaRMM as SYSTEM ##

$Username = "admin"
$Password = "password"

$group = "Administrators"

$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }

if ($existing -eq $null) {

    Write-Host "Creating new local user $Username."
    & NET USER $Username $Password /add /y /expires:never

    Write-Host "Adding local user $Username to $group."
    & NET LOCALGROUP $group $Username /add

}
else {
    Write-Host "Setting password for existing local user $Username."
    $existing.SetPassword($Password)
}

## Sets password as never expires ##
Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$Username'" SET PasswordExpires=FALSE

## Hides User Account from Login page ##
$path = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList'
New-Item $path | New-ItemProperty -Name admin -Value 0 -PropertyType DWord
