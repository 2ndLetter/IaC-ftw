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

root script:
1. Install dependencies (local workstation)
2. Build environment (S3 bucket)
3. Build AMI (Puppet configs, Python/Bash script for IP address)
4. Deploy Application (Apply roles)