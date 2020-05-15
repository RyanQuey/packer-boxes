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

# I don't think it's necessary, but I'm not sure why not, since it's in official docker docs
# systemctl enable docker

# just check status
systemctl status docker

# so don't have to use sudo for docker
# https://docs.docker.com/engine/install/linux-postinstall/
# of course don't need sudo in here, since ran within root, but whatever
sudo groupadd docker
usermod -aG docker ${USER}
# I think this refreshes the bash groups so that it makes sure it gets added
newgrp docker 

# so docker has access to its own folder, give it access
# TODO TEST I don't know if this is needed. Seemed to be needed for pulling apache/nifi image, or if not, it was adding the `usermod` or `groupadd` commands that I added after this chown command that did it. Ie., either need both that and this, or just that, and not this.
sudo chown :docker -R /var/lib/docker/tmp

# docker compose
# Download deliverable and move to target location
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Allow execution
sudo chmod +x /usr/local/bin/docker-compose
