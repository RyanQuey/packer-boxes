#!/bin/bash -eux

# rvm
echo "****************************"
echo "now getting rvm"
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
apt-add-repository -y ppa:rael-gc/rvm
apt-get -y update
apt-get -y install rvm
# refresh the shell
exec $SHELL

# don't get any for now, not sure what I'll be working on in future
# rvm install ruby
