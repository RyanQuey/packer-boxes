# Linux Packer configurations. Based on Jeff Geerling's Packer build configurations for Vagrant boxes.

TODO note that the easy-config box has all the latest scripts for ubuntu18.04 setup. Need to put in more generic spot probably 

## Home config files: 
make sure to put in the `shared/home-configs` and layout as if it was the home folder

- Make sure to set VAGRANT_CLOUD_TOKEN on your [tokens page](https://app.vagrantup.com/settings/security).
- in cmder, would use admin console, and `setx VAGRANT_CLOUD_TOKEN "..." /M`

- Make some changes in the dev env and want to update this repository? Run the `update-home-configs.sh` script in the `shared/home-configs` folder and it will copy all of the home configs I use over automatically
## Different build jsons
![Validate Packer JSON files](https://github.com/geerlingguy/packer-boxes/workflows/Validate%20Packer%20JSON%20files/badge.svg)

This project contains the Packer build configurations for all of Jeff Geerling's (geerlingguy's) Vagrant Boxes. Each box builds a minimal base box for use with VirtualBox. Available boxes include:

  - [geerlingguy/ubuntu2004](https://app.vagrantup.com/geerlingguy/boxes/ubuntu2004) - [`ubuntu2004` directory](ubuntu2004/)
  - [geerlingguy/ubuntu1804](https://app.vagrantup.com/geerlingguy/boxes/ubuntu1804) - [`ubuntu1804` directory](ubuntu1804/)
  - [geerlingguy/ubuntu1604](https://app.vagrantup.com/geerlingguy/boxes/ubuntu1604) - [`ubuntu1604` directory](ubuntu1604/)
  - [geerlingguy/centos8](https://app.vagrantup.com/geerlingguy/boxes/centos8) - [`centos8` directory](centos8/)
  - [geerlingguy/centos7](https://app.vagrantup.com/geerlingguy/boxes/centos7) - [`centos7` directory](centos7/)
  - [geerlingguy/centos6](https://app.vagrantup.com/geerlingguy/boxes/centos6) - [`centos6` directory](centos6/)
  - [geerlingguy/debian10](https://app.vagrantup.com/geerlingguy/boxes/debian10) - [`debian10` directory](debian10/)
  - [geerlingguy/debian9](https://app.vagrantup.com/geerlingguy/boxes/debian9) - [`debian9` directory](debian9/)
  - [geerlingguy/debian8](https://app.vagrantup.com/geerlingguy/boxes/debian8) - [`debian8` directory](debian8/)

All of these boxes are available as public, free Vagrant boxes and can be used with the command:

    vagrant init geerlingguy/[box name here]

You can also fork this repository and customize a build configuration with your own Ansible roles and playbooks to build a fully custom Vagrant box using Packer. For one such example, see the [Drupal VM Packer Build](https://github.com/geerlingguy/packer-drupal-vm).

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build any of these Vagrant boxes:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/)
  (note: removing ansible currently from this project. Maybe add back in later)
  - [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Usage

Make sure all the required software (listed above) is installed, then cd into one of the box directories and run:

    `packer build box-config.json`

After a few minutes, Packer should tell you the box was generated successfully, and the box was uploaded to Vagrant Cloud.

> **Note**: This configuration includes a post-processor that pushes the built box to Vagrant Cloud (which requires a `VAGRANT_CLOUD_TOKEN` environment variable to be set); remove the `vagrant-cloud` post-processor from the Packer template to build the box locally and not push it to Vagrant Cloud. You don't need to specify a `version` variable either, if not using the `vagrant-cloud` post-processor.

- To use spark: Download spark (not including installation in this packer setup currently), and then move to home folder and rename to `spark`. This allows use of env var that is set in .bashrc automatically

### Building _all_ the boxes
#### NOTE no longer doing, unless we add ansible back in

Whenever VirtualBox is updated, it's best to re-build _all_ the base boxes so they have the latest guest additions.

Assuming you have Ansible and Packer installed already, and you have a `VAGRANT_CLOUD_TOKEN` available in your environment, you can run the playbook to build and push updated versions for all the boxes:

    ansible-playbook build-boxes.yml

You can also build and push just one box:

    ansible-playbook build-boxes.yml -e "{'boxes':['debian10']}"


## Development
when ready to make a new version, update the version in the box-config

After changing, make sure to test with:
`packer validate box-config.json`
## Testing built boxes

There's an included Vagrantfile that allows quick testing of the built Vagrant boxes. From the same box directory, run the following command after building the box:

    $ vagrant up

Test that the box works correctly, then tear it down with:

    $ vagrant destroy -f

## License

### Released under MIT License

Copyright (c) 2020 Ryan Quey.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Original Author

Based on configurations are maintained by [Jeff Geerling](https://www.jeffgeerling.com), author of [Ansible for DevOps](https://www.ansiblefordevops.com).

