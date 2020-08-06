#!/bin/bash -eux

# copies all the local home config files from this repository to this local environment
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project, IN THE VM not in the virtualbox host

# currently NOT copying 01-netcfg.yaml, since not always needed, and might mess somethings up, I Don't know
cp -r $HOME/projects/packer-boxes/shared/home-configs/{.vimrc,.tmux.conf,.bashrc,.inputrc,.gitconfig,.gitignore,.vim/,global_extra_conf.py} $HOME/ 
exec $SHELL
