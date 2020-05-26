
#######################
# vim
echo "now getting YouCompleteMe"
which npm

# YouCompleteMe
## https://github.com/ycm-core/YouCompleteMe#linux-64-bit
apt install -y build-essential cmake vim python3-dev
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
cd ~/.vim/bundle/YouCompleteMe


## https://stackoverflow.com/a/40131786/6952495
### assumes we have 3.6 installed, which I think we do automatically above with python3-dev (?)
### NOTE YCM recommends at least vim 8.1 for java completion, and default as of May 2020 is 8.0
### if want go completion, need to install Go and add flag: --go-completer
### Maybe don't want --clang-completer, it's for C family and I don't use C, C# etc...but instructions say to use it in some places
### --all only works if we have go and mono-complete installed already. Not doing for now
# /usr/bin/python3.6 ./install.py --all
/usr/bin/python3.6 ./install.py  --java-completer --ts-completer

