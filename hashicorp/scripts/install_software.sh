#!/bin/bash -e

# Install apache
sudo yum -y install httpd

# Start & Enable apache
sudo systemctl start httpd && sudo systemctl enable httpd

# Install Puppet
sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm

# Install Puppet Agent
sudo yum install puppet-agent -y

# Add secure_path
echo 'Defaults secure_path = /sbin:/bin:/usr/sbin/usr/bin:/opt/puppetlabs/bin' | sudo tee -a /etc/sudoers.d/extra

# Reload bash
bash

# Check Installed Puppet Agent version
sudo puppet agent --version