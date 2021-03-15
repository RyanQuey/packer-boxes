#!/bin/bash -eux

# copies all the local home config files over to this repository
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source $parent_path/_shared_vars.sh

# https://stackoverflow.com/a/50359929/6952495
# be careful with eval! BUt ok since it all comes from within our own script
eval "cp -r $HOME/{$HOME_CONFIGS_TO_SYNC_WITH_PACKER_REPO} ~/projects/packer-boxes/shared/home-configs/ "




# cp $HOME/.vimrc $HOME/projects/packer-boxes/shared/home-configs/
# 
# cp $HOME/.tmux.conf $HOME/projects/packer-boxes/shared/home-configs/
# 
# cp ~/.bashrc ~/projects/packer-boxes/shared/home-configs/
# cp ~/.bash_profile ~/projects/packer-boxes/shared/home-configs/
# cp $HOME/.bashrc $HOME/projects/packer-boxes/shared/home-configs/
# cp $HOME/.inputrc $HOME/projects/packer-boxes/shared/home-configs/
# 
# cp $HOME/.gitconfig $HOME/projects/packer-boxes/shared/home-configs/
# cp $HOME/.gitignore $HOME/projects/packer-boxes/shared/home-configs/
# # ycm global config file. file name is important, needed for vimrc to work
# cp $HOME/global_extra_conf.py $HOME/projects/packer-boxes/shared/home-configs/
# 
# # this will try to copy things that we won't keep, like YCM. But whatever
# cp -r $HOME/.vim $HOME/projects/packer-boxes/shared/home-configs/
