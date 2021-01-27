# Performing a clean setup after fresh Ubuntu install

## Check for updates
```
sudo apt update
```

```
sudo apt upgrade
```

## Setup SSH
```
sudo apt install ssh
```
```
sudo ufw allow ssh
```
or if specifying a different port than 22. Change to required port.
```
sudo ufw allow 22/tcp
```

## Prepare drivers

## Install drivers

## Prepare to install docker and container toolkit
```
sudo apt update
```
```
sudo apt upgrade
```
```
sudo apt install curl
```
## Install docker
```
curl https://get.docker.com | sh \
  && sudo systemctl start docker \
  && sudo systemctl enable docker
```
  
## Install container toolkit
```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
``` 

```
sudo apt-get update
```
```
sudo apt-get install -y nvidia-docker2
```

```
sudo systemctl restart docker
```

```
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

## Add user to docker group
TODO: Double check this is right
```
sudo usermod -a -G docker $USER
```
