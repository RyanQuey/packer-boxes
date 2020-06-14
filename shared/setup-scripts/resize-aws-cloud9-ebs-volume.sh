#!/bin/bash

# copied from: https://docs.aws.amazon.com/cloud9/latest/user-guide/move-environment.html
# use like this: 
# 		sh resize.sh 20
#
# this would resize to 20GiB
#
# make sure the aws user has permission however.
# see here: https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-access-not-authorized
# to do this, login to this ec2 using root user or an admin user
# ***OR just change the size in the console, and then just run the _partition-hd.sh script on its own***

# NOTE make sure to run from within the EC2 instance itself
# Specify the desired volume size in GiB as a command-line argument. If not specified, default to 20 GiB.
SIZE=${1:-20}

# Get the ID of the environment host Amazon EC2 instance.
INSTANCEID=$(curl http://169.254.169.254/latest/meta-data//instance-id)

# Get the ID of the Amazon EBS volume associated with the instance.
VOLUMEID=$(aws ec2 describe-instances \
  --instance-id $INSTANCEID \
  --query "Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId" \
  --output text)

# Resize the EBS volume.
aws ec2 modify-volume --volume-id $VOLUMEID --size $SIZE

# Wait for the resize to finish.
while [ \
  "$(aws ec2 describe-volumes-modifications \
    --volume-id $VOLUMEID \
    --filters Name=modification-state,Values="optimizing","completed" \
    --query "length(VolumesModifications)"\
    --output text)" != "1" ]; do
sleep 1
done

# refactoring partitioning out so can call on its own if needed
bash $HOME/projects/packer-boxes/shared/setup-scripts/_partion-hd.sh
