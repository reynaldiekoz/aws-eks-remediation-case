# EKS Cluster

module "eks" {
  source                    = "terraform-aws-modules/eks/aws"
  version                   = "18.28.0"
  cluster_name              = var.cluster_name
  cluster_version           = "1.23"
  subnet_ids                = module.vpc.private_subnets
  vpc_id                    = module.vpc.vpc_id
  cluster_additional_security_group_ids = [aws_security_group.eks_cluster_sg.id]
  # Encryption key
  create_kms_key = true
  cluster_encryption_config = [{
    resources = ["secrets"]
  }]
  kms_key_deletion_window_in_days = 7
  enable_kms_key_rotation         = true

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
    attach_cluster_primary_security_group = true
    
  }

  eks_managed_node_groups = {
    rey-nodes = {
      min_size     = 1
      max_size     = 2
      desired_size = var.des_capacity
      instance_types = [var.instance_type]
      capacity_type  = "SPOT"
      labels = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }

      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "node-group"
          effect = "NO_SCHEDULE"
        }
      }

      update_config = {
        max_unavailable_percentage = 50 # or set `max_unavailable`
      }

      tags = {
        ExtraTag = "example"
      }
    }
  }
}

/*
  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = var.worker_group
      instance_type                 = var.instance_type
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.eks_cluster_sg.id]
      asg_desired_capacity          = var.des_capacity
    },
  ]
*/

   


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
