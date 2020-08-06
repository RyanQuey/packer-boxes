# make sure to call with `sudo` 
# combines several of the other scripts into one to run
# TODO add some options depending on what I want to setup for this box, and add cli flags to call those options

mkdir -p $HOME/projects

git clone https://github.com/RyanQuey/packer-boxes.git $HOME/projects/packer-boxes

sudo bash $HOME/projects/packer-boxes/shared/setup-scripts/update-local-from-home-configs.sh
sudo bash $HOME/projects/packer-boxes/shared/setup-scripts/make-current-user-owner.sh



