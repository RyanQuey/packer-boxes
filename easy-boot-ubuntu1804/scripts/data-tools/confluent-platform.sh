# confluent platform
# https://docs.confluent.io/3.1.1/installation.html#installation-apt
# if this doesn't work can just install the tar
# https://docs.confluent.io/3.1.1/installation.html#installation-archive
# includes kafka, zookeeper, more
# free forever if I stick to one broker

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
curl -L http://client.hub.confluent.io/confluent-hub-client-latest.tar.gz?_ga=2.264753805.389808541.1588848062-1363768875.1588848062 | tar xzv

