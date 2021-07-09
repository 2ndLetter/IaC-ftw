#!/bin/bash -e

# Create random bucket name and create the terraform.tfvars file
if [[ $1 == new_bucket ]]
then
  export BUCKET_NAME=iacftw-$(openssl rand -base64 48 | sed -e 's/+//g' -e 's/\///g' -e 's/[A-Z]//g')
  printf "bucket_name = \"$BUCKET_NAME\"" > terraform.tfvars
else
  echo "no bucket names changed"
fi
echo "The s3 bucket $BUCKET_NAME will be created"

terraform plan
sleep 5

terraform apply --auto-approve
sleep 5

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
