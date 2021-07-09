#!/bin/bash -eux

# copies all the local home config files from this repository to this local environment
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project, IN THE VM not in the virtualbox host

# currently NOT copying 01-netcfg.yaml, since not always needed, and might mess somethings up, I Don't know
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source $parent_path/_shared_vars.sh

# run first, since the next command errors out and stops the bash script
cp $HOME/projects/packer-boxes/shared/home-configs/.ssh/config ~/.ssh/config

# https://stackoverflow.com/a/50359929/6952495
# be careful with eval! BUt ok since it all comes from within our own script
# TODO just switch to rsync, this is getting ridiculous. And exclude YCM
eval "cp -r $HOME/projects/packer-boxes/shared/home-configs/{$HOME_CONFIGS_TO_SYNC_WITH_PACKER_REPO} ~/"


exec $SHELL
