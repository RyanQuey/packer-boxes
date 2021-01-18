#!/bin/bash -eux

# replacing what he had in the original ansible.sh script
# if doesn't work when using packer, can always just call from vagrant too

#######################

# java 8
# TODO consider using sdkman instead?? for now, not bothering, too much hassle
# TODO move to separate file
sudo apt-get -y install openjdk-8-jdk

# maven for java
sudo apt -y install maven

