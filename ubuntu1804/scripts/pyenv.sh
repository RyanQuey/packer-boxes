#!/bin/bash -eux
# pyenv
echo "****************************"
echo "now getting pyenv installer for pyenv"
curl https://pyenv.run | bash
# refresh the bash, though 
exec $SHELL
