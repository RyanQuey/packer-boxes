#!/bin/bash -eux

# kubernetes 
echo "****************************"
echo "now getting kubernetes"
echo "(NOTE not being ran automatically)"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# Make the file executable
chmod +x ./kubectl

# Move the binary in to your PATH.
sudo mv ./kubectl /usr/local/bin/kubectl

#Test to ensure the version you installed is up-to-date:
kubectl version --client

# kind, which helps manage use kubernetes in development
# from kubernetes tutorial by DataStax https://github.com/DataStax-Academy/kubernetes-workshop-online/tree/master/0-setup-your-cluster
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
