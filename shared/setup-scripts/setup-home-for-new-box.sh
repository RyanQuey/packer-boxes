# make sure to call with `sudo` 
# combines several of the other scripts into one to run
# TODO add some options depending on what I want to setup for this box, and add cli flags to call those options

mkdir -p ~/projects

git clone https://github.com/RyanQuey/packer-boxes.git ~/projects/packer-boxes

sudo bash ~/projects/packer-boxes/shared/home-configs/update-local-from-home-configs.sh
