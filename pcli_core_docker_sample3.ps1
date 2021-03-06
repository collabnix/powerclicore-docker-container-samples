<#
.SYNOPSIS Run PowerCLI script w/PowerCLI Core Docker Container and pass in parameters interactively or via command-line
.NOTES  Author:  William Lam
.NOTES  Site:    www.virtuallyghetto.com
.NOTES  Reference: http://www.virtuallyghetto.com/2016/10/5-different-ways-to-run-powercli-script-using-powercli-core-docker-container.html
.NOTES  Docker Command: docker run --rm -it --entrypoint='/usr/bin/powershell' \
    -v /Users/lamw/scripts:/tmp/scripts vmware/powerclicore /tmp/pcli_core_docker_sample3.ps1
.NOTES  Docker Command: docker run --rm -it --entrypoint='/usr/bin/powershell' \
    -v /Users/lamw/scripts:/tmp/scripts vmware/powerclicore /tmp/scripts/pcli_core_docker_sample3.ps1 -VI_SERVER 192.168.1.150 -VI_USERNAME administrator@vghetto.local -VI_PASSWORD VMware1! -VI_VM DummyVM
#>

param(
    [Parameter(Mandatory=$true)]
    [String]$VI_SERVER,

    [Parameter(Mandatory=$true)]
    [String]$VI_USERNAME,

    [Parameter(Mandatory=$true)]
    [String]$VI_PASSWORD,

    [Parameter(Mandatory=$true)]
    [String]$VI_VM
)

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false | Out-Null

Write-Host -ForegroundColor magenta "`nVariables from Docker Client ..."
Write-Host "VI_SERVER=$VI_SERVER"
Write-Host "VI_USERNAME=$VI_USERNAME"
Write-Host "VI_PASSWORD=$VI_PASSWORD"
Write-Host "VI_VM=$VI_VM"

Write-Host "`nConnecting to vCenter Server ..."
Connect-VIServer -Server $VI_SERVER -User $VI_USERNAME -password $VI_PASSWORD | Out-Null

$time = (Get-Date).toString()
Write-Host "Updating VM Notes ..."
Set-VM -VM (Get-VM -Name $VI_VM) -Notes "Current Time: $time" -Confirm:$false | Out-Null

Write-Host "Disconnecting ...`n"
Disconnect-VIServer * -Confirm:$false
