#!/bin/bash -eux

# replacing what he had in the original ansible.sh script
# if doesn't work when using packer, can always just call from vagrant too

#######################

# set acquire by hash, to fix hash sum mismathes (was getting all the time in Japan)
# see here: https://unix.stackexchange.com/a/273441/216300
echo "Acquire::By-Hash \"yes\"; ">/etc/apt/apt.conf.d/01byhash

# Install some basic repositories
apt -y update && apt-get -y upgrade
apt -y install software-properties-common
apt -y install apt-transport-https ca-certificates curl

#######################
# get some dev env stuff setup
echo "****************************"
sudo bash ./vim.sh


echo "****************************"
echo "now getting some other standard dev tools"
# make sure we use the global gitignore
git config --global core.excludesfile ~/.gitignore

# not doing screen anymore
apt-get -y install tmux

apt -y install net-tools
sudo apt -y install tree

# install snap
sudo apt -y install snapd
## TODO move to different file
# heroku
snap install --classic heroku

# java 8
# TODO move to separate file
sudo apt-get -y install openjdk-8-jdk

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
