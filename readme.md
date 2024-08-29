# List of commands

## Install drivers
```sudo ubuntu-drivers autoinstall``` 

## Common errors:

look at the logs to see if ollama uses gpu, if not enter the container
`sudo docker exec -it ollama /bin/bash` 

run `nvidia-smi`

if the message is `Failed to initialize NVML: Unknown Error`

exit the container and edit `sudo nano /etc/nvidia-container-runtime/config.toml`
change this to false `no-cgroups = false`
then restart docker service `sudo systemctl restart docker`

## add the nvidia runtime

install: `sudo apt-get install nvidia-driver-535`

reboot the system: `sudo reboot`

test with: `nvidia-smi`

restart docker: `sudo systemctl restart docker`

install nvidia tool kit: `https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html`

restart docker: `sudo systemctl restart docker`

edit `sudo nano /etc/docker/daemon.json` and add

```
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```

## Docker logs

check the logs to see if ollama has found the gpu: `sudo docker logs ollama -f`

## Whatch the gup work
`watch -n0.1 nvidia-smi`
