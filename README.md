# aws-eks-remediation-case
Experimental eks aws terraform things with some use cases

## Usage
Example usage (locally)
```hcl
module "modules" {
  source            = "./modules"
  aws_region        = "ap-southeast-1"
  aws_profile       = "reynaldi"
  vpc_name          = "reynaldi-tf-EKS"
  vpc_cidr_block    = "10.0.0.0/16"
  public_subnets    = ["10.0.4.0/24", "10.0.5.0/24"]
  private_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  name_prefix       = "reyekstf-SG"
  worker_group      = "reyekstf-WKRGRP"
  instance_type     = "t2.small"
  cluster_name      = "reyekstf-CLUSTER" 
  des_capacity      = "2"

}
```
## Notes

* This module using AccessKey and SecretKey are from aws cli configured `profile`. If you have not set them
  yet, please install [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure it.
  
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.20.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_aws) | >= 2.0.1 |


## License

MIT Licensed. See LICENSE for full details.



## Reference

* [Terraform-Learn-EKS(AWS)](https://learn.hashicorp.com/tutorials/terraform/eks?in=terraform/kubernetes)
* [Terraform-AWS-EKS(AWS)](https://github.com/terraform-aws-modules/terraform-aws-eks)
* [Terraform-Learn-EKS(AWS) Github](https://github.com/hashicorp/learn-terraform-provision-eks-cluster)

## Remediation Cases
* Remediation resource AWS
* Logging Enabled on CloudWatch

## Standart and Compliance 
* AWS EKS security groups allow incoming traffic only on TCP port 443 Done. 
* Envelope encryption for EKS Kubernetes Secrets is enabled using Amazon KMS Done.
* EKS control plane logging is enabled for your Amazon EKS clusters Done.
* The latest version of Kubernetes is installed on your Amazon EKS clusters Done.
* Amazon EKS configuration changes are monitored Done. 

## Remediation Solution Steps
* Required IAM User with AdministratorAccess or you can costumize it using RBAC principal (since i was deploying on my own aws account and just for testing perpose thats why i just use AdministatorAccess )

## How to setup the infrastructure for testing?
* Prepare AWS Account
* Create IAM User with needed permisson
* Install AWS CLI locally to load aws profile so we dont need to input Access Key and Secret Key we can just simply select the aws profile that configured in AWS CLII
* Install Terrafrom Locally to run the script

## How to setup the infrastructure for testing?
* aws configure --profile reynaldi (you can use custom name and edit the variable on next step)
* terraform init
* terraform validate
* terraform apply
* terraform destroy (if all the use cases was completed to avoid extra cost XD)

## Variable / Parameter used
* some variable have been described on variable.tf
* im using to call terraform-aws-eks module to simplify the script so its basiclly we depend on the module

## File / Folder details

* put all the script on modules so we can easily call and change the  variable via main.tf
* im naming the files as its used for, ex eks.tf contain eks terraform configuration.. etc

Thank you!







