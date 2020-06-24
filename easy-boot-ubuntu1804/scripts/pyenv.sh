#!/bin/bash -eux
# pyenv
echo "****************************"
echo "now getting pyenv installer for pyenv"

# some good defaults: What google uses. https://cloud.google.com/python/setup

curl https://pyenv.run | bash
# refresh the bash, though 
exec $SHELL

# install some basic pythons. 
# I don't know what I want with 2.7.18 at this point...but probably will
pyenv install 3.7.7
pyenv install 2.7.18
pyenv global 2.7.18 3.7.7

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

python get-pip.py
python3 get-pip.py

# install venv
sudo apt-get -y install python3-venv
