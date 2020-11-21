#!/bin/bash -eux
# pyenv
echo "****************************"
echo "now getting sbt/scala stuff"


# https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html
# currently not bothering with sdkman, just use regular java 8 and sbt from debian package

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
