# Original script author unknown, additions by TRECpro.
# Choose whatever Primary and Secondary DNS Servers you want. Some common
# DNS Services are listed below, but you can use whatever you want.
#
# Level3                209.244.0.3 209.244.0.4
# Verisign                    64.6.64.6 64.6.65.6
# Google                    8.8.8.8 8.8.4.4
# Quad9                        9.9.9.9 149.112.112.112
# DNS.WATCH                    84.200.69.80 84.200.70.40
# Comodo Secure DNS            8.26.56.26 8.20.247.20
# OpenDNS Home                208.67.222.222 208.67.220.220
# Norton ConnectSafe        199.85.126.10 199.85.127.10
# DNS Filter            	103.247.36.36 103.247.37.37 

#http://powershell-guru.com/powershell-tip-63-check-if-a-computer-is-member-of-a-domain-or-workgroup/
if ((Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain){
    write-host "Domain member, we better not update the DNS!!"
    exit
}

$DNSServers = $args[0],$args[1]

$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration | where{$_.IPEnabled -eq "TRUE"}

function get-return-status {
        Param ($code)
        If ($code -eq 0) {
                return "Success."
  } elseif ($code -eq 1) {
                return "Success, but Restart Required."
  } else {
                return "Error with Code $($code)!"
  }
}

Foreach($NIC in $NICs) {
  ""
  "-------"
  "Attempting to modify DNS Servers for the following NIC:"
  $NIC
  $returnValue = $NIC.SetDNSServerSearchOrder($DNSServers).ReturnValue
  $response = get-return-status($returnValue)
  Write-Host "Setting DNS Servers to ${$NICs}...$($response)"
  $returnValue = $NIC.SetDynamicDNSRegistration("True").ReturnValue
  $response = get-return-status($returnValue)
  Write-Host "Setting Dynamic DNS Registration to True...$($response)"
}
