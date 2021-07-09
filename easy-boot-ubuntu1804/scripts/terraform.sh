#!/bin/bash -eux

# Install terraform gpg key / repository.
apt -y update && apt-get -y upgrade
apt -y install software-properties-common gnupg curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install terraform.
apt -y update
apt -y install terraform 
