#!/bin/bash -e

# Create random bucket name and create/update the terraform.tfvars files
if [[ $1 == new_bucket ]]
then
  export BUCKET_NAME=iacftw-$(openssl rand -base64 48 | sed -e 's/+//g' -e 's/\///g' -e 's/[A-Z]//g')
  printf "bucket_name = \"$BUCKET_NAME\"" > terraform.tfvars
  printf "bucket_name = \"$BUCKET_NAME\"" >> application/terraform.tfvars
else
  echo "No s3 bucket created/re-created, run \"./3-build.sh new_bucket\" if you need to create/re-create the application s3 bucket."
fi
echo "The s3 bucket $BUCKET_NAME will be created."

terraform init
sleep 5

terraform plan
sleep 5

terraform apply --auto-approve
