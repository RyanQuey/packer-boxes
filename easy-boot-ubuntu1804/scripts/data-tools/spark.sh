#!/bin/bash -eux

# TODO not tested OR added as a script to the box-config.json

# Spark 2.4.5 for Hadoop 2.7
# https://spark.apache.org/downloads.html
# for the same reason as Cassandra, not getting 3.0
# NOT TESTED
echo "now getting spark 2.4.5"
curl "https://www.apache.org/dyn/closer.lua/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz" | tar xzv
 
