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
echo "now getting vim and other standard dev tools"
apt-get -y install vim
# nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

# make sure we use the global gitignore
git config --global core.excludesfile ~/.gitignore

# not doing screen anymore
apt-get -y install tmux

apt -y install net-tools
sudo apt -y install tree

# YouCompleteMe
## https://github.com/ycm-core/YouCompleteMe#linux-64-bit
apt install -y build-essential cmake vim python3-dev
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
cd ~/.vim/bundle/YouCompleteMe


## https://stackoverflow.com/a/40131786/6952495
### assumes we have 3.6 installed, which I think we do automatically above with python3-dev (?)
### if want go completion, need to install Go and add flag: --go-completer
### Maybe don't want clang-completer, it's for C family and I don't use C, C# etc...but instructions say to use it in some places
/usr/bin/python3.6 ./install.py --clang-completer --java-completer --ts-completer
python3 install.py --all



# install snap
sudo apt -y install snapd
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
