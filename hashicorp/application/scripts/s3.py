#!/usr/bin/python3

import boto3

# Retrieve the list of existing buckets
s3 = boto3.client('s3')
response = s3.list_buckets()

list = []

# Output the bucket names
for bucket in response['Buckets']:
    list.append(f'{bucket["Name"]}')

for line in list:
    if "iacftw" in line:
        print(line)