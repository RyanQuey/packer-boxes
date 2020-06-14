#!/bin/bash -eux

# TODO not tested OR added as a script to the box-config.json

echo "****************************"
echo "now getting Kafka (Zookeeper is bundled inside)"
# TODO note that I'm not sure if we need this if we're using kafka, since kafka comes packaged with it

cd ~
curl -L https://ftp.tsukuba.wide.ad.jp/software/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz | tar xzv

