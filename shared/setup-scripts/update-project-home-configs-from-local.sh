#!/bin/bash -eux

# copies all the local home config files over to this repository
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project

cp ~/.vimrc ~/projects/packer-boxes/shared/home-configs/

cp ~/.tmux.conf ~/projects/packer-boxes/shared/home-configs/

cp ~/.bashrc ~/projects/packer-boxes/shared/home-configs/
cp ~/.inputrc ~/projects/packer-boxes/shared/home-configs/

cp ~/.gitconfig ~/projects/packer-boxes/shared/home-configs/
cp ~/.gitignore ~/projects/packer-boxes/shared/home-configs/
# ycm global config file. file name is important, needed for vimrc to work
cp ~/global_extra_conf.py ~/projects/packer-boxes/shared/home-configs/

# this will try to copy things that we won't keep, like YCM. But whatever
cp -r ~/.vim ~/projects/packer-boxes/shared/home-configs/
