# makes the current user the owner of all files that are not currently the user's
# based on: https://askubuntu.com/a/829539/594870
# I'm not sure what this will do in vagrant if ran during provisioning, so do not run during provisioning
sudo find ~ -user root -exec sudo chown $USER: {} +

