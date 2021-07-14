#!/bin/bash -xe
#exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#sudo yum update -y

export APP_BUCKET=$(aws s3api list-buckets --query 'Buckets[?contains(Name, `iacftw`)].Name' --output text)

export READ_WEBSERVER_IP=$(aws s3 cp s3://$APP_BUCKET/object.txt -)

echo "The ip address is $READ_WEBSERVER_IP" > /var/www/html/index.html