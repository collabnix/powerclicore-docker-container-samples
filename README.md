## Clone the Repository


```git clone https://github.com/collabnix/powerclicore-docker-container-samples
```

Edit the settings:

```
$VI_SERVER = "XX.XX.XX.XX"
$VI_USERNAME = "root"
$VI_PASSWORD = "xxxx"
$VI_VM = "DummyVM"
```

## Example-1

Listing out VMs and ESXi Host

```
docker run --rm --entrypoint="/usr/bin/pwsh" -v ${PWD}/scripts:/tmp/scripts vmware/powerclicore /tmp/scripts/vm-housekeeping.ps1
```


