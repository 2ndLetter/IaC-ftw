#!/bin/bash -e

aws ec2 create-key-pair --key-name $1 | jq '.[]' | sed -n '2 p' | sed -e 's/"//g' > ~/.ssh/$1.pem

aws ec2 describe-key-pairs

