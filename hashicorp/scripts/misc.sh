#!/bin/bash -e

#/bin/false

# Install boto3
pip3 install boto3
#pip3 install boto3 --user

# Check ntp configuration
sudo ntpq -p

# Check python3 installation
python3 -V
pip3 -V

# Create default index.html
echo '<h1><center>Infrastructure as Code FTW - default site</center></h1>' > /tmp/index.html
sudo mv /tmp/index.html /var/www/html/

# Check website
curl http://localhost