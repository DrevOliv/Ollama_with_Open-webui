# List of commands

## Install drivers
```sudo ubuntu-drivers autoinstall``` 

## Docker logs
`sudo docker logs ollama -f`

## Whatch the gup work
`watch -n0.1 nvidia-smi`

## Common errors:

look at the logs to see if ollama uses gpu, if not enter the container
`sudo docker exec -it ollama /bin/bash` 

run `nvidia-smi`

if the message is `Failed to initialize NVML: Unknown Error`

exit the container and edit `sudo nano /etc/nvidia-container-runtime/config.toml`
change this to false `no-cgroups = false`
then restart docker service `sudo systemctl restart docker`
