#!/bin/python3

import boto3

ec2 = boto3.client('ec2')
response = ec2.describe_instances(
    Filters=[
        {
            'Name': 'tag:Name',
            'Values': [
                'webserver',
            ],
        },
        {
            'Name': 'instance-state-name',
            'Values': [
                'running',
            ],
        },
    ],
)

IP=(response['Reservations'][0]['Instances'][0]['PrivateIpAddress'])

print(IP)

# Retrieve the list of existing buckets
s3 = boto3.client('s3')
response = s3.list_buckets()

list = []

# Output the bucket names
for bucket in response['Buckets']:
    list.append(f'{bucket["Name"]}')

for line in list:
    if "iacftw" in line:
        app_bucket=line

print(app_bucket)

s3.put_object(Body=IP, Bucket=app_bucket, Key='object.txt')