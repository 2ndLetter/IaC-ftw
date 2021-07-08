#!/bin/bash -x

# Check selinux status
sudo sestatus

# Disable selinux
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config

# Check selinux status
sudo sestatus