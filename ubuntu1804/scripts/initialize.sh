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
echo "now getting vim and other standard dev tools"
apt-get -y install vim

# not doing screen anymore
apt-get -y install tmux
apt -y install net-tools
sudo apt -y install tree

# java 8
# TODO move to separate file
sudo apt-get -y install openjdk-8-jdk

sudo apt -y install maven
######################
# setup my dev env folders
echo "****************************"
cd ~
mkdir ~/projects/
# don't bother pulling anything here, it's fast enough to do when add later

# for adding the insecure public key
mkdir ~/.ssh
