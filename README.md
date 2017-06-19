## Clone the Repository

```
cd /root/
```

```git clone https://github.com/ajeetraina/powerclicore-docker-container-samples
Cloning into 'powerclicore-docker-container-samples'...
remote: Counting objects: 7, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 7 (delta 3), reused 7 (delta 3), pack-reused 0
Unpacking objects: 100% (7/7), done.
Checking connectivity... done.
```

Edit the settings:

$VI_SERVER = "10.94.214.191"
$VI_USERNAME = "root"
$VI_PASSWORD = "xxxx"
$VI_VM = "DummyVM"


## Example-1

docker run --rm -it \
-v /root/powerclicore-docker-container-samples/scripts:/tmp/scripts vmware/powerclicore /tmp/scripts/pcli_core_docker_sample1.ps1
