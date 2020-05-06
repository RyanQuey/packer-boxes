#!/bin/bash -eux

# replacing what he had in the original ansible.sh script

#######################
# Install some basic repositories
apt -y update && apt-get -y upgrade
apt -y install software-properties-common

#######################
# get some dev env stuff setup
sudo apt-get install vim

#######################
# get some clis I like

# docker
# see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
sudo apt install apt-transport-https ca-certificates curl software-properties-common


######################

# Install Ansible.
apt -y update

# setup some config files for development in the vm
