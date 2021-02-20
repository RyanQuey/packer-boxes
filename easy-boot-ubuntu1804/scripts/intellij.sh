#!/bin/bash -eux

# download the tarball
# NOTE requires root permissions
cd /opt

TARBALL_NAME=ideaIC-2020.3.2.tar.gz?_ga=2.218983706.2046653183.1613813914-1178290066.1613813914
curl -LO https://download.jetbrains.com/idea/${TARBALL_NAME}
mv $TARBALL_NAME intellij

# note also starter script to start intellij in teh home files
