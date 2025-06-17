AWS EC2 and S3 Infrastructure Provisioning using Terraform

This project automates the provisioning of an EC2 instance and an S3 bucket using Terraform on Ubuntu 22.04.

🔧 Prerequisites

Ubuntu 22.04 machine (or EC2/DigitalOcean instance)

AWS account and IAM user with appropriate permissions

Pre-created Key Pair in your AWS region

Terraform installed

AWS CLI installed

🧱 Install Terraform on Ubuntu 22.04

sudo su -

apt update

apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install terraform

terraform -v

📁 Directory and File Setup

mkdir newdirectory

cd newdirectory

Create the following files with appropriate Terraform code:

main.tf, ec2.tf, s3.tf, iam.tf, variables.tf, outputs.tf, startup.sh, setup.sh

deploy.yaml

Edit these files using your preferred editor (e.g., vi, nano, vscode).

🛠️ AWS CLI Configuration

Install and configure the AWS CLI:

sudo apt install awscli

aws configure

Provide:

Access Key ID

Secret Access Key

Default region (e.g., us-east-1)

Output format (e.g., json)

🚀 Terraform Workflow

Initialize Terraform:

terraform init

Run a plan to preview the infrastructure:

terraform plan

Provide Input When Prompted:

S3 Bucket Name (must be globally unique)

Key Pair Name (already created in AWS)

Environment (e.g., dev or prod)

Apply the infrastructure:

terraform apply

Type yes to confirm and provision the infrastructure.

✅ What This Does

Creates an EC2 instance in the configured AWS region.

Creates a unique S3 bucket.

Uses startup.sh and setup.sh scripts to configure the instance.

Optional deployment using deploy.yaml (e.g., for Kubernetes or Ansible).

🧼 Cleanup

To destroy the created resources:

terraform destroy

📎 Notes

Make sure your Key Pair exists in the same region where you’re deploying the EC2.

Ensure proper IAM permissions for the access key used.

Scripts like startup.sh and setup.sh must be executable (chmod +x).

📁 License

This project is for learning/demo purposes. No license included.
