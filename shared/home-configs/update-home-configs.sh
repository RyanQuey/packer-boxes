#!/bin/bash -eux

# copies all the local home config files over to this repository
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project

cp ~/.vimrc ~/projects/packer-boxes/shared/home-configs/
cp ~/.bashrc ~/projects/packer-boxes/shared/home-configs/
cp ~/.inputrc ~/projects/packer-boxes/shared/home-configs/
cp ~/.gitconfig ~/projects/packer-boxes/shared/home-configs/
cp ~/.gitignore ~/projects/packer-boxes/shared/home-configs/

