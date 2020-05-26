
#######################
# vim
echo "now getting vim"
which npm
## Easier, but not latest version: 
### apt-get -y install vim

### remove previous versions
sudo apt-get -y remove vim vim-runtime vim-tiny vim-common
### We want at least 8.2 for YouCompleteMe. And needs certain options set. So following instructions from You CompleteMe:
#### https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source
sudo apt -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
  python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

cd ~

# latest branch as of 5/2020. But want to lock it in so is consistent with rest of configuration
# https://stackoverflow.com/a/21699307/6952495 for specifying branch. --depth 1 keeps us from downloading whole repository: we only want this one branch
git clone --depth 1 --branch "v8.2.0825" https://github.com/vim/vim.git

cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) 
# don't need C
            #--enable-cscope 
# don't need perl
#            --enable-perlinterp=yes \
# don't need lua
#            --enable-luainterp=yes \
# don't need gui
#            --enable-gui=gtk2 \

# getting folder for ubuntu 18 from here: https://gist.github.com/leolord/bb51bdee3f199c2a6cfe2d57a42a2c26#file-vim-sh-L34
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
#### If you want to be able to easily uninstall vim use checkinstall.
##### sudo apt -y install checkinstall
##### cd ~/vim
##### sudo checkinstall
sudo make install
#### cleanup
# rm -rf ~/vim/

#### set as default text editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim


### if running not in this script, make sure to open a new bash terminal to start using the latest vim


# nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

sh ~/projects/packer-boxes/easy-boot-ubuntu1804/scripts/_you_complete_me.sh
