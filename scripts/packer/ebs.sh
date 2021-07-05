#!/bin/bash -x

# Find the block device
block_device=`lsblk -a -d -e 230 | grep $? | cut -d' ' -f1 | sed -n 2p` && echo $block_device

# Set the block device
vol_group_device=/dev/$block_device && echo $vol_group_device

# Create a new partition
/bin/echo -e "d\n\nn\n\n\n\n\nw" | sudo fdisk $vol_group_device || true

# Sync the disk
sudo partprobe

# Format the partition
sudo mkfs -t ext4 $vol_group_device

# Create new directory
sudo mkdir /var/app

# Mount app directory on new partition
sudo mount -t auto $vol_group_device /var/app

# Find parition UUID
blkid

# Create & Move index.html
echo '<h1><center>Infrastructure as Code FTW</center></h1>' > /tmp/index.html
sudo mv /tmp/index.html /var/www/html/
