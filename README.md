# IaC-ftw

Todo:
- [Puppet] Update the web server's configuration to direct traffic to the new EBS volume for web server content
- [Python3] Configure script to retrieve ip address from AWS API
- [Terraform] Update index.html
- [Packer] Move consumer_userdata.sh tasks to a cron job
- [Terraform] Configure s3 bucket policies, update IAM roles accordingly

Run each script in its own directory:
- Step 1 = root directory
- Steps 2-5 = hashicorp directory
- Steps 6-7 = hashicorp/application directory

Steps/Scripts:
1. [1-prep.sh] Install dependencies if required (local workstation)
2. [2-s3-bucket-build.sh] Create s3 bucket for remote state storage [build workspace]
3. [3-keypair.sh][option] Create keypair for ec2 instances (enter the name of the keypair you want as an option)
4. [4-build.sh][new_bucket] Build environment (use "./3-build.sh new_bucket" when creating the s3 bucket) (bucket policies) <-----------
5. [5-bake.sh] Bake AMI (Install python3.6+, Python script for IP address, Puppet configs) <-----------
6. [6-s3-bucket-app.sh] Create s3 bucket for remote state storage
7. [7-deploy.sh] Deploy Application (userdata write/read to s3) <-----------

Notes:
- vpc cidr 10.0.0.0/16 needs to be available
- Recommend using puppet version 5 or 6 (I used 6 and had problems with the latest version "7")
- Instructions need s3 bucket for state file added (OBE)
- Assumes local workstation has permisisons to aws account
- Recommend looking into WSL2 (https://docs.microsoft.com/en-us/windows/wsl/install-win10) for local Development Environment
- Recommended courses from A Cloud Guru: TBD
- "~/.aws/configure" example:
    [default]
    region = us-east-1
    output = json
- "~/.aws/credentials" example:
    [default]
    aws_access_key_id = {Access Key ID}
    aws_secret_access_key = {Secret Access Key}