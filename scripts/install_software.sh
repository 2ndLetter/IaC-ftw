#!/bin/bash -x

# Install apache
sudo yum -y install httpd

# Start & Enable apache
sudo systemctl start httpd && sudo systemctl enable httpd