<#
.SYNOPSIS Getting a list of VM and ESXi Host and saving it to SCV Format all using Docker container
.NOTES  Author:  Ajeet S Raina
.NOTES  Site:    www.collabnix.com
.NOTES  Reference: TBD
.NOTES  docker run --rm --entrypoint="/usr/bin/pwsh" -v ${PWD}/scripts:/tmp/scripts vmware/powerclicore /tmp/scripts/script_getting_vm_esxhost.ps1 
#>

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false | Out-Null

$VI_SERVER = "100.98.26.108"
$VI_USERNAME = "root"
$VI_PASSWORD = "dell@123"

Write-Host "VI_SERVER=$VI_SERVER"
Write-Host "VI_USERNAME=$VI_USERNAME"
Write-Host "VI_PASSWORD=$VI_PASSWORD"

Write-Host "`nConnecting to vCenter Server ..."
Connect-VIServer -Server $VI_SERVER -User $VI_USERNAME -password $VI_PASSWORD | Out-Null

Write-Host "\nGetting ESXi Details"
Get-VMHost | Export-Csv -path "/tmp/scripts/myreport.csv" –NoTypeInformation

Write-Host "`nGetting VMs List ..."
Get-VM | Out-Null



Write-Host "Get-VM"

Write-Host "Disconnecting ...`n"
Disconnect-VIServer * -Confirm:$false
