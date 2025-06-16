Launch one EC2 instance with configurations like AMI, instance type, keypair, security group etc and connect it to the CLI 
sudo su -

search install terraform on ubuntu 22.04 digital ocean in browser
https://docs.digitalocean.com/reference/terraform/getting-started/

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform -v

mkdir newdirectory
cd newdirectory
ls
created files and added the code using the vi editor to different files respectively as per the requirement
Files which I have created are s3.tf, ec2.tf, main.tf, variables.tf, outputs.tf, iam.tf, startup.sh, setup.sh, deploy.yaml

Next executed the terraform commands like
terraform init
terraform plan
Give the unique name for the S3 bucket which we want to create
Next it will ask for the key pair name for the EC2 instance then give the key pair name which is already created and available in that region
In the next step it will ask about the environment like dev/prod then just type dev 

aws configure
apt install awscli

Created access key and secret key for the IAM user
Added credentials like access key, secret key, region and format

terraform apply
Again add the same 
S3 bucket name
key pair name
environment name

next just type yes

It will create the S3 bucket and EC2 instance in the region which we have provide in the code.
