#!/bin/bash -e

# Export required terraform outputs
export aws_subnet_id=$(terraform output -raw SUB_ID_WEBSERVER)
export aws_security_group=$(terraform output -raw SSH_SG_ID)

# Validate Packer template
packer validate packer-webserver-1.json
sleep 5

# Build AMI
packer build \
-var "aws_subnet_id=$aws_subnet_id" \
-var "aws_security_group=$aws_security_group" \
packer-webserver-1.json
