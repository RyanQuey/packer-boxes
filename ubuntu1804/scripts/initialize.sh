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


# install snap
sudo apt -y install snapd
# heroku
snap install --classic heroku

# java 8
# TODO move to separate file
sudo apt -y install openjdk-11-jdk-headless
sudo apt -y install openjdk-8-jdk-headless

# maven for java
sudo apt -y install maven

# Postgres
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
sudo apt -y install postgresql postgresql-contrib

######################
# setup my dev env folders
echo "****************************"
cd ~
mkdir ~/projects/
# don't bother pulling anything here, it's fast enough to do when add later

# for adding the insecure public key
mkdir ~/.ssh
