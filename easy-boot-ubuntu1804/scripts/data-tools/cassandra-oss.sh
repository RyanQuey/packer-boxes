#!/bin/bash -eux

# TODO not tested OR added as a script to the box-config.json

# cassandra 3.11.6
# https://cassandra.apache.org/doc/latest/getting_started/installing.html#choosing-an-installation-method
# not yet feeling adventurous enough to try anything '*.0', so not getting 4.0
# NOTE needs to be after we already got java 8
# they actually generally recommend downloading via tarball, rather than apt, and in my experience got some hash sum errors trying with apt, so just do tar for now
echo "****************************"
echo "now getting Cassandra OSS"
cd ~
curl -L "http://apache.mirror.digitalpacific.com.au/cassandra/3.11.6/apache-cassandra-3.11.6-bin.tar.gz" | tar xzv

