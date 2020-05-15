#!/bin/bash -eux

# dse
# based on 6.8
# note that before 6.8, couldn't do just one apt install, had to call one for several packages
echo "****************************"
echo "now getting datastax (dse)"
sudo apt-get -y install libaio1
echo "deb https://debian.datastax.com/enterprise/ stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
curl -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install dse-full
