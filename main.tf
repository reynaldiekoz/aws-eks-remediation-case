
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





##public_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
##private_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]