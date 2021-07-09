#!/bin/bash -e

terraform init
sleep 5

terraform plan
sleep 5

terraform apply --auto-approve