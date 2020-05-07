#!/bin/bash -eux
# pyenv
echo "****************************"
echo "now getting pyenv installer for pyenv"
curl https://pyenv.run | bash
exec $SHELL
