## Created by Steven Grabowski from SyncroMSP Community


<#
Make sure you change the variables to match your business information

Logo needs to be in BMP format, 120 x 120 pixels

Upload your logo to the PC and name it "logo.bmp"
Set up the file to download to:  c:\windows\temp\logo.bmp


Modified code from:
https://weikingteh.wordpress.com/2015/01/13/powershell-script-to-insert-branding-oem-and-custom-wallpaper/

#>

$logo = "logo.bmp" 
$scriptroot = "c:\windows\temp"
$CoName = "Your Biz"
$CoPhone = "(206) 555-1212"
$CoHours = "8:00am to 5:00pm"
$CoUrl = "https://yoursite.com"


If (-not(Test-Path c:\windows\system32\oobe\info\backgrounds)){New-item c:\windows\system32\oobe\info\backgrounds -type directory}

copy-item $scriptroot\$logo "c:\windows\system32\"
copy-item $scriptroot\$logo "c:\windows\system32\oobe\info\" 


# Registry Changes
$strPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" 
$strPath2 = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" 
$strPath3 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" 
$strPath4 = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

Set-ItemProperty -Path $strPath -Name Logo -Value "C:\Windows\System32\$logo" 
Set-ItemProperty -Path $strPath -Name Manufacturer -Value "$CoName" 
Set-ItemProperty -Path $strPath -Name SupportPhone -Value "$CoPhone" 
Set-ItemProperty -Path $strPath -Name SupportHours -Value "$CoHours" 
Set-ItemProperty -Path $strPath -Name SupportURL -Value $CoUrl 
Set-ItemProperty -Path $strPath2 -Name OEMBackground -value 1

#New-Item -Path HKLM:\Software\Policies\Microsoft\Windows -Name Personalization –Force
#New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies -Name System -Force
