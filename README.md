# IaC-ftw

## Prepare Developer Workstation
- Install Packer and Terraform
- Download this GitHub Repo
- Configure AWS credentials (if required)
## Task 1 - Web Server ec2 Instance Creation (aws console)
- COMPLETE
## Task 2 - Web Server AMI Creation (Packer)
- COMPLETE
## Task 3 - Configure via Puppet Local Modules
- DO LAST
## Task 4 - Update Web Server via Packer/Puppet
- IN PROGRESS (4.1/4.2)
- 4.3 DO LAST
## Task 5 - Deploy Infrastructure via Terraform
## Task 6 - Deploy Second ec2 Instance via Terraform

1. Finish building out environment (s3 bucket, IAM Roles)
2. Finish baking AMIs (importing terraform outputs, Puppet configs, python script)
3. Deploy application

Notes:
- vpc cidr 10.0.0.0/16 needs to be available
- Instructions need 33 bucket for state file added
- Assumes local workstation has permisisons to aws account
- Recommend looking into WSL2 (https://docs.microsoft.com/en-us/windows/wsl/install-win10)

scripts:
1. [1-prep.sh] Install dependencies if required (local workstation)
2. [2-s3-bucket-build.sh] Create s3 bucket for build remote state storage
3. [3-keypair.sh][option] Create keypair for ec2 instances (enter the name of the keypair you want as an option)
4. [4-build.sh][new_bucket] Build environment (use "./3-build.sh new_bucket" when creating the s3 bucket)
5. [5-bake.sh] Bake AMI (Puppet configs, Python/Bash script for IP address)
6. [6-s3-bucket-app.sh] Create s3 bucket for app remote state storage
7. [7-deploy.sh] Deploy Application (ASGs, Launch Configs, fix keypair format, check selinux, userdata yum update)