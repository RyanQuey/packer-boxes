#!/bin/bash -eux

# replacing what he had in the original ansible.sh script
# if doesn't work when using packer, can always just call from vagrant too

#######################
# Install some basic repositories
apt -y update && apt-get -y upgrade
apt -y install software-properties-common

#######################
# get some dev env stuff setup
echo "****************************"
echo "now getting vim"
apt-get -y install vim

#######################
# get some clis I like
# TODO can do some of this using preseeds instead, to get docker cli and more

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

#####################
# some version managers for languages I use

# nvm
echo "****************************"
echo "now getting nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# install node 8 and 10 for now
nvm install 8
nvm install 10

# rvm
echo "****************************"
echo "now getting rvm"
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
apt-add-repository -y ppa:rael-gc/rvm
apt-get -y update
apt-get -y install rvm
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

# don't get any for now, not sure what I'll be working on in future
# rvm install ruby

# pyenv
echo "****************************"
echo "now getting pyenv installer for pyenv"
curl https://pyenv.run | bash
exec $SHELL

######################
# setup my dev env folders
echo "****************************"
cd ~
mkdir ~/projects/
# don't bother pulling anything here, it's fast enough to do when add later

# for adding the insecure public key
mkdir ~/.ssh
