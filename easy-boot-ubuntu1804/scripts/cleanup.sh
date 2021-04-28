#!/bin/bash -eux

# Apt cleanup.
apt autoremove
apt update

# Delete unneeded files.
# RQ: I'm not sure why these are unneeded
# rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
# NOTE currently failing due to lack of free space...maybe adding some space will help it?
# seems unnecessary, leave off for now
# dd if=/dev/zero of=/EMPTY bs=1M
# rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
# sync
