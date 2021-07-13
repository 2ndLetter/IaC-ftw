#!/bin/bash -e

#/bin/false

# Check ntp configuration
sudo ntpq -p

# Check python3 installation
python3 -V
pip -V

# Create default index.html
echo '<h1><center>Infrastructure as Code FTW - default site</center></h1>' > /tmp/index.html
sudo mv /tmp/index.html /var/www/html/

# Check website
curl http://localhost