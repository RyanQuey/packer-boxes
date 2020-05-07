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
apt-get -y install screen
apt -y install net-tools

# java 8
apt-get -y install openjdk-8-jre-headless
######################
# setup my dev env folders
echo "****************************"
cd ~
mkdir ~/projects/
# don't bother pulling anything here, it's fast enough to do when add later

# for adding the insecure public key
mkdir ~/.ssh
