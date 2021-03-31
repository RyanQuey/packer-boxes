#!/bin/bash -eux

# Add vagrant user to sudoers. (a vagrant recommended setting)
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
# not sure why I'd want this
# echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic
