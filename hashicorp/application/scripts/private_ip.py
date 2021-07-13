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
print(response['Reservations'][0]['Instances'][0]['PrivateIpAddress'])