
#Prevent Installation of Removable Media Drivers
#Need Administrative Privllige

#Coded By Karem Ali


If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(

   [Security.Principal.WindowsBuiltInRole] “Administrator”))

{

 Write-Warning “You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!”

 Pause
 Break

}

$Path= "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions"
[int]$Value = 1
[string]$Name = "DenyRemovableDevices"

echo " 1- Prevent Installation of Removable Media " " 2- Allow Installation of Removable Media  " 
$Option = Read-Host "Enter"

if($Option -eq 1 )
{
New-ItemProperty -Path $Path -Name $Name -PropertyType DWORD  -Value $Value
echo " Installation is Prevented "  
pause
}

elseif($Option -eq 2 )
{
Remove-ItemProperty -Path $Path -Name $Name 

echo " Installation IS Allowed "
Pause
}
else
{
echo " Unvalid Option "
pause
}