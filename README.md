# IaC-ftw

Steps/Scripts:
/ dir:
    1. [1-prep.sh] Install dependencies if required (local workstation)

hashicorp dir:
    2. [2-s3-bucket-build.sh] Create s3 bucket for build remote state storage
    3. [3-keypair.sh][option] Create keypair for ec2 instances (enter the name of the keypair you want as an option)
    4. [4-build.sh][new_bucket] Build environment (use "./3-build.sh new_bucket" when creating the s3 bucket)
    5. [5-bake.sh] Bake AMI (Install python3.6+, Python script for IP address, do puppet configs with bash <-----------, Puppet configs)

hashicorp/application/ dir:
    6. [6-s3-bucket-app.sh] Create s3 bucket for app remote state storage
    7. [7-deploy.sh] Deploy Application (userdata write/read to s3) <-----------

Notes:
    - vpc cidr 10.0.0.0/16 needs to be available
    - Instructions need s3 bucket for state file added (OBE)
    - Assumes local workstation has permisisons to aws account
    - Recommend looking into WSL2 (https://docs.microsoft.com/en-us/windows/wsl/install-win10) for local Development Environment