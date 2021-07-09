#!/bin/bash -e

# Create unique s3 bucket name
export BUCKET_NAME=tf-remote-state-storage-$(openssl rand -base64 24 | sed -e 's/+//g' -e 's/\///g' -e 's/[A-Z]//g')

# Create s3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME

# Verify creation
aws s3 ls

# Create backend.tf file

printf "terraform {\n  backend \"s3\" {\n    bucket = \"$BUCKET_NAME\"\n    region = \"us-east-1\"\n    key = \"terraform.tfstate\"\n  }\n}" > hashicorp/backend.tf

