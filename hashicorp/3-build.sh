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

terraform init
sleep 5

terraform plan
sleep 5

terraform apply --auto-approve
