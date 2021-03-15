# make sure to call with `sudo` 
# combines several of the other scripts into one to run
# download and run using: sudo apt-get install git && curl -LO https://raw.githubusercontent.com/RyanQuey/packer-boxes/master/shared/setup-scripts/setup-home-for-new-box.sh && sudo bash setup-home-for-new-box.sh
# TODO add some options depending on what I want to setup for this box, and add cli flags to call those options

mkdir -p $HOME/projects

git clone https://github.com/RyanQuey/packer-boxes.git $HOME/projects/packer-boxes

bash $HOME/projects/packer-boxes/shared/setup-scripts/update-local-from-home-configs.sh
bash $HOME/projects/packer-boxes/shared/setup-scripts/make-current-user-owner.sh



