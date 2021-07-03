#!/bin/bash -x

# Install apache
sudo yum -y install httpd

# Start & Enable apache
sudo systemctl start httpd && sudo systemctl enable httpd

# Install Puppet
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm