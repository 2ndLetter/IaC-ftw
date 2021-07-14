# IaC-ftw

READY FOR REVIEW !!

Run each script in its own directory:
- Prep = root directory
- Steps 1-4 = hashicorp directory
- Steps 5-6 = hashicorp/application directory

Steps/Scripts:
Optional Prep = [prep.sh] Install dependencies if required (local workstation)
1. [1-s3-bucket-build.sh] Create s3 bucket for remote state storage
2. [2-keypair.sh][key-name] Create keypair for ec2 instances [example: "./2-keypair My-EC2-Key"]
3. [3-build.sh][new_bucket] Build environment, use option when running the first time [example: "./3-build.sh new_bucket]
4. [4-bake.sh] Bake AMI

- cd application

5. [5-s3-bucket-app.sh] Create s3 bucket for remote state storage
6. [6-deploy.sh] Deploy Application

Notes:
- vpc cidr 10.0.0.0/16 needs to be available
- Recommend using puppet version 5 or 6 (I used 6 and had problems with the latest version "7")
- Recommend instructions having s3 bucket for remote state file
- Remove step for running Pupper via a cron job
- Recommend looking into WSL2 (https://docs.microsoft.com/en-us/windows/wsl/install-win10) for local Development Environment (Ubuntu)
- Recommended courses from A Cloud Guru: HashiCorp Packer, HashiCorp Certified Terraform Associate, Python 3 Scripting for System Administrators, Dabble in the various Puppet courses
- A Cloud Guru also has Cloud Sandboxes and Playgrounds (this is what I used to build/test my IaC)
- My steps assume your local workstation has permisisons to an aws account
- "~/.aws/configure" example:
    [default]
    region = us-east-1
    output = json
- "~/.aws/credentials" example:
    [default]
    aws_access_key_id = {Access Key ID}
    aws_secret_access_key = {Secret Access Key}