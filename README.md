
AWS EC2 and S3 Infrastructure Provisioning using Terraform This project automates the provisioning of an EC2 instance and an S3 bucket using Terraform on Ubuntu 22.04.

🔧 Prerequisites Ubuntu 22.04 machine (or EC2/DigitalOcean instance)

AWS account and IAM user with appropriate permissions

Pre-created Key Pair in your AWS region

Terraform installed

AWS CLI installed

🧱 Install Terraform on Ubuntu 22.04 AWS EC2 and S3 Infrastructure Provisioning using Terraform

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

deploy.yaml, dev.json, dev.tfvars, prod.json, prod.tfvars, user_data.sh

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

AMI to use for EC2

(for example

Enter a value: ami-0a7d80731ae1b2435)

AWS Region

(for example

Enter a value: us-east-1)

S3 Bucket Name (must be globally unique)

(for example

Enter a value: mynewuniquetests3bucket440)

Environment name (e.g., dev or prod)

(for example

Enter a value: dev)

EC2 instance type

(for example

Enter a value: t2.micro)

Key Pair Name (already created in AWS)

(for example

Enter a value: mynewkeypair)

Apply the infrastructure:

terraform apply

Type yes to confirm and provision the infrastructure.

next run this command (This command removes the resource from Terraform state without touching the actual infrastructure.)

terraform state rm aws_s3_bucket_lifecycle_configuration.lifecycle

Test Upload to S3 (Step-by-Step)

✅ 1. Create a Test File

echo "Hello from Chandan!" > testfile.txt

✅ 2. Upload the File to Your S3 Bucket

Replace with your actual bucket name:

aws s3 cp testfile.txt s3://bucket_name/

✅ Example:

(as we have created a s3 bucket named mynewuniquetests3bucket440 replace with mynewuniquetests3bucket440)

aws s3 cp testfile.txt s3://mynewuniquetests3bucket440/

✅ 3. Verify the Upload

aws s3 ls s3://mynewuniquetests3bucket440/

You should see testfile.txt in the output.

✅ 4. (Optional) Download the File Back

To confirm the upload:

aws s3 cp s3://mynewuniquetests3bucket440/testfile.txt downloaded.txt

cat downloaded.txt

You should see:

Hello from Chandan!

Health Check

curl de-instance_public-ip

(for example: curl 54.85.254.127)

dev deployment successful This confirms:

Your application is up and running on port 80

The EC2 instance (dev-instance with public ip for example 54.85.254.127 ) is reachable publicly

Your deployment succeeded and the health check passes

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
