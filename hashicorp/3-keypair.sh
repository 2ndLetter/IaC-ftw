#!/bin/bash -e

# Create keypair in aws account and local ~/.ssh folder
aws ec2 create-key-pair --key-name $1 | jq '.[]' | sed -n '2 p' | sed -e 's/"//g' > ~/.ssh/$1.pem

# Add keypair name to application/terraform.tfvars file
echo "key_name = \"$1\"" > application/terraform.tfvars

aws ec2 describe-key-pairs

