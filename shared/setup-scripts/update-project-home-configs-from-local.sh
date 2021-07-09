#!/bin/bash -eux

# copies all the local home config files over to this repository
# NOTE not to be ran within the packer build process, but to be ran while developing this packer project

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source $parent_path/_shared_vars.sh

# make sure to run first, next command errors out
# since .ssh folder has secure stuff, only want this one config
# NOTE will generate errors like cp: cannot overwrite non-directory '/home/ryan/projects/packer-boxes/shared/home-configs/.vim/bundle/nerdtree/.git' with directory '/home/ryan/.vim/bundle/nerdtree/.git'
# but that's fine, it's just because we made these projects in .vim/bundle submodules somewhere along the line, so .git is just a file. Don't need to update those

# TODO just switch to rsync, this is getting ridiculous. And exclude YCM
cp ~/.ssh/config $HOME/projects/packer-boxes/shared/home-configs/.ssh/config 
# https://stackoverflow.com/a/50359929/6952495
# be careful with eval! BUt ok since it all comes from within our own script
eval "cp -r $HOME/{$HOME_CONFIGS_TO_SYNC_WITH_PACKER_REPO} $HOME/projects/packer-boxes/shared/home-configs/ "





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

# NOTE unfortunately does not run because above script errors I think...so just gitignore it for now
# just nuke you complete me...what a headache. But it's so big and messes things up
rm -rf $HOME/projects/packer-boxes/shared/home-configs/.vim/bundle/YouCompleteMe

