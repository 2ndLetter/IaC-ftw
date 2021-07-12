#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum update -y

export APP_BUCKET=$(aws s3api list-buckets --query 'Buckets[?contains(Name, `iacftw`)].Name' --output text)

aws ec2 describe-instances --filters "Name=tag:Name,Values=webserver" "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].{PrivateIpAddresses:PrivateIpAddress}' --output text | aws s3 cp - s3://$APP_BUCKET/object.txt