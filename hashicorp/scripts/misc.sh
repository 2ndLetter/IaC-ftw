#!/bin/bash -e

#/bin/false

# Check ntp configuration
sudo ntpq -p

# Check python3 installation
python3 -V

# Check website
curl http://localhost