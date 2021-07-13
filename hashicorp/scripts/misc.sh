#!/bin/bash -e

#/bin/false

sudo systemctl status ntpd

sudo ntpq -p

python3 -V