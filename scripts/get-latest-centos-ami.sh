#!/bin/bash

aws ec2 describe-images \
    --owners '125523088429' \
    --filters 'Name=name,Values=CentOS 7*' 'Name=architecture,Values=x86_64' \
    --query 'sort_by(Images, &CreationDate)[-1].[ImageId]' \