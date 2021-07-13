#!/bin/bash -e

# Install apache
#sudo yum -y install httpd

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

# Install vim because it's the best
sudo yum install vim -y

# Install aws cli
sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

# Install Puppet ntp module
sudo puppet module install puppetlabs-ntp --version 9.0.1

# Install Puppet python module
sudo puppet module install puppet-python --version 6.1.0

# Install boto3
sudo pip3 install boto3
#pip3 install boto3 --user

# Install Puppet Apache module
sudo puppet module install puppetlabs-apache --version 6.3.0

### Install python3 and Boto3 [temp config until Puppet is implemented]
##sudo yum groupinstall "Development Tools" -y
##sudo yum install openssl-devel libffi-devel bzip2-devel -y
##sudo yum install wget -y
##sudo yum install epel-release
##wget https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz
##tar xvf Python-3.9.6.tgz
##cd Python-3.9*/
##./configure --enable-optimizations
##sudo make altinstall
##
### Check Python Installation
##python3.9 --version
##
### Check pip installation
##pip3.9 --version
##
### Install boto
##pip3 install boto botocore boto3 --upgrade --user