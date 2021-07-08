#!/bin/bash -e

# Create random strings for s3

export TF_VAR_bucket=IaCFTW-$(openssl rand -base64 24 | sed -e 's/+//g' -e 's/\///g')

# Build AWS Environment
terraform init
sleep 5
terraform plan
sleep 5
terraform apply --auto-approve
sleep 10

# Export required terraform outputs
export aws_subnet_id=$(terraform output -raw SUB_ID)
export aws_security_group=$(terraform output -raw SSH_SG_ID)

# Validate Packer template
packer validate packer-webserver-1.json
sleep 5

# Build AMI
packer build \
-var "aws_subnet_id=$aws_subnet_id" \
-var "aws_security_group=$aws_security_group" \
packer-webserver-1.json
