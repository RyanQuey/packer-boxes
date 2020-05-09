#!/bin/bash -eux

# TODO not tested OR added as a script to the box-config.json

# cassandra 3.11.6
# https://cassandra.apache.org/doc/latest/getting_started/installing.html#choosing-an-installation-method
# not yet feeling adventurous enough to try anything '*.0', so not getting 4.0
# NOTE needs to be after we already got java 8
# they actually generally recommend downloading via tarball, rather than apt, and in my experience got some hash sum errors trying with apt, so just do tar for now
echo "****************************"
echo "now getting Cassandra"
cd ~
curl -OL "http://apache.mirror.digitalpacific.com.au/cassandra/3.11.6/apache-cassandra-3.11.6-bin.tar.gz"
tar xzvf "apache-cassandra-3.11.6-bin.tar.gz"
rm "apache-cassandra-3.11.6-bin.tar.gz"

# Spark 2.4.5 for Hadoop 2.7
# https://spark.apache.org/downloads.html
# for the same reason as Cassandra, not getting 3.0
"https://www.apache.org/dyn/closer.lua/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"

echo "****************************"
echo "now NOT getting Zookeeper"
# TODO note that I'm not sure if we need this if we're using kafka, since kafka comes packaged with it


# confluent platform
# https://docs.confluent.io/3.1.1/installation.html#installation-apt
# if this doesn't work can just install the tar
# https://docs.confluent.io/3.1.1/installation.html#installation-archive
# includes kafka
echo "****************************"
echo "now getting confluent platform"
wget -qO - http://packages.confluent.io/deb/3.1/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://packages.confluent.io/deb/3.1 stable main"
# make sure it is the open source version, since we're not paying for it!
sudo apt-get -y update && sudo apt-get -y install confluent-platform-oss-2.11

# confluent hub
# https://docs.confluent.io/current/connect/managing/confluent-hub/client.html#linux
echo "****************************"
echo "now getting confluent hub"
curl -OL http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz?_ga=2.264753805.389808541.1588848062-1363768875.1588848062
tar xzvf confluent-hub-client-latest.tar.gz
rm confluent-hub-client-latest.tar.gz
