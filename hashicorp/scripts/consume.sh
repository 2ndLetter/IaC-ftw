#!/bin/bash

export APP_BUCKET=$(/usr/local/bin/aws s3api list-buckets --query 'Buckets[?contains(Name, `iacftw`)].Name' --output text)

export READ_WEBSERVER_IP=$(/usr/local/bin/aws s3 cp s3://$APP_BUCKET/object.txt -)

wget http://$READ_WEBSERVER_IP -P /tmp

sudo mv /tmp/index.html /var/www/html/index.html