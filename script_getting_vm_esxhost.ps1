<#
.SYNOPSIS Run a static/hardcoded PowerCLI script w/PowerCLI Core Docker Container
.NOTES  Author:  William Lam
.NOTES  Site:    www.virtuallyghetto.com
.NOTES  Reference: http://www.virtuallyghetto.com/2016/10/5-different-ways-to-run-powercli-script-using-powercli-core-docker-container.html
.NOTES  Docker Command: docker run --rm -it --entrypoint='/usr/bin/powershell' \
    -v /Users/lamw/scripts:/tmp/scripts vmware/powerclicore /tmp/scripts/pcli_core_docker_sample1.ps1
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
