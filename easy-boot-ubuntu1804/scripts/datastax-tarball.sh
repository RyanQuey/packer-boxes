#!/bin/bash -eux

# dse
# based on 6.8
# note that before 6.8, couldn't do just one apt install, had to call one for several packages
# https://docs.datastax.com/en/install/6.8/install/dseBasicInstall.html
echo "****************************"
echo "now getting datastax (dse) tarball"
sudo apt-get -y install libaio1
curl -LO https://downloads.datastax.com/enterprise/dse-6.8.tar.gz | tar xz


echo "****************************"
echo "now getting DSE studio "
curl -LO https://downloads.datastax.com/datastax-studio/datastax-studio-6.8.0.tar.gz | tar xz


# These permissions I think don't work by default, unless we change the authentication? Or maybe using dse cassandra rather than service dse start? 

sudo mkdir -p /var/lib/cassandra; sudo chown -R $USER:$GROUP /var/lib/cassandra
sudo mkdir -p /var/log/cassandra; sudo chown -R $USER:$GROUP /var/log/cassandra

# for analytics
# https://docs.datastax.com/en/install/6.8/install/installTARdse.html
sudo mkdir -p /var/lib/dsefs; sudo chown -R $USER:$GROUP /var/lib/dsefs && 
  sudo mkdir -p /var/lib/spark; sudo chown -R $USER:$GROUP /var/lib/spark && 
  sudo mkdir -p /var/log/spark; sudo chown -R $USER:$GROUP /var/log/spark &&
  sudo mkdir -p /var/lib/spark/rdd; sudo chown -R $USER:$GROUP /var/lib/spark/rdd  &&
  sudo mkdir -p /var/log/spark/master; sudo chown -R $USER:$GROUP /var/log/spark/master  &&
  sudo mkdir -p /var/log/spark/alwayson_sql; sudo chown -R $USER:$GROUP /var/log/spark/alwayson_sql  &&
  sudo mkdir -p /var/lib/spark/worker; sudo chown -R $USER:$GROUP /var/lib/spark/worker

# these might or might not be necessary, but shouldn't hurt anything, and seemed to hel pbefore, though having trouble finding anything but SO answers that say to do this
mkdir -p /var/lib/cassandra/commitlog && sudo chown -R $USER:$GROUP /var/lib/cassandra/commitlog

# . One time it seemed to be needed, but then also needed to run the above afterward to get it to work, so maybe actually just needed to do the above and not change permissions for hadoop2-clinet dir?
sudo chown -R $USER:$GROUP /etc/dse/hadoop2-client/

