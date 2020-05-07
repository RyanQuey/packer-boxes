#!/bin/bash -eux

# docker
# see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
echo "****************************"
echo "now getting docker"
apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt -y update
apt-cache policy docker-ce
apt -y install docker-ce docker-ce-cli containerd.io
echo "docker status"
systemctl status docker

# so don't use for docker
usermod -aG docker ${USER}
su - ${USER}

