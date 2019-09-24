# Base workstation setup
This repository serves to handle packer builds of a base workstation IDE using VIM.

Currently it supports only Fedora 29 on docker, however it will soon support alpine as well as more builders other than docker.

# Usage
```
ansible-galaxy install -r ansible/roles/requirements.yml -p ansible/roles/
# Configure keys.json with the docker registry keys
packer build -var-file=keys.json fedora.json
```
