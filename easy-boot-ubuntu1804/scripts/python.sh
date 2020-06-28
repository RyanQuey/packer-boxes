#!/bin/bash -eux
# pyenv
echo "****************************"
echo "now getting Python stuff"

# some good defaults: What google uses. https://cloud.google.com/python/setup
# not using pyenv anymore; venv can handle it on its own https://stackoverflow.com/questions/1534210/use-different-python-version-with-virtualenv/39713544#39713544

sudo apt -y install python3 python3-dev python3-venv

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# use for python 2 and python 3
python get-pip.py
python3 get-pip.py
