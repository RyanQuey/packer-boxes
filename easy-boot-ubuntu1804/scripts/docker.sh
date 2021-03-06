#!/bin/bash -eux

# setup everything for docker, docker compose

# I think can't execute as root or this won't work (e.g., the $USER will fail). use:
#
#     sudo bash ./docker.sh
#
# see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
echo "****************************"
echo "now getting docker"
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt -y update
sudo apt-cache policy docker-ce

# these last ones are failing recently due to SHA sum mismatch; just don't run for now. Haven't tested with the new binary operators eitehr TODO
sudo apt -y install docker-ce docker-ce-cli containerd.io && \

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# echo "docker status"
# just check status
# systemctl status docker

# so don't have to use sudo for docker
# https://docs.docker.com/engine/install/linux-postinstall/
# of course don't need sudo in here, since ran within root, but whatever
sudo groupadd docker && \
sudo usermod -aG docker ${USER:-ryan} && \
# I think this refreshes the bash groups so that it makes sure it gets added...not strictly necessary in a packer config, but helpful if we call from inside vm sometime
newgrp docker  && \

# so docker has access to its own folder, give it access
# TODO TEST I don't know if this is needed. Seemed to be needed for pulling apache/nifi image, or if not, it was adding the `usermod` or `groupadd` commands that I added after this chown command that did it. Ie., either need both that and this, or just that, and not this.
# this is the one that, if it doesn't run, will break the whole thing, and then packer will destroy the vm. presumably breaks if the directory below doesn't exist, which is definitely true if docker doesn't install, maybe true anyways if it does install
sudo chown :docker -R /var/lib/docker/tmp

# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

