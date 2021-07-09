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
- need to add s3 bucket for state file

scripts:
1. [1-prep.sh] Install dependencies if required (local workstation)
2. [2-s3-bucket.sh] Create s3 bucket for remote state storage
3. [3-keypair.sh] Create keypair for ec2 instances
4. [4-build.sh] Build environment (keypairs) (use "./3-build.sh new_bucket" when creating the s3 bucket)
5. [5-bake.sh] Bake AMI (Puppet configs, Python/Bash script for IP address)
6. [6-deploy.sh] Deploy Application (Apply roles)