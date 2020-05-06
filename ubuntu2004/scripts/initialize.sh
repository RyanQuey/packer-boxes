#!/bin/bash -eux

# replacing what he had in the original ansible.sh script

# Install Ansible repository.
apt -y update && apt-get -y upgrade
apt -y install software-properties-common

# Install Ansible.
apt -y update

