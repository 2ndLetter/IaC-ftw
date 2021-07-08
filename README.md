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

1. Create VPC, Security Groups, S3 bucket, IAM Roles, Single Subnet, IGW, NACLs, and Route Tables (Terraform)
2. Bake AMI (Packer, Puppet)
3. Deploy 2 EC2 Instances from the AMI (Terraform)

Notes:
- vpc cidr 10.0.0.0/16 needs to be available