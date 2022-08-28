variable "vpc_name" {
  description = "The specification of module name."
  type        = string
  default     = "tf-eks-reytest"
}

variable "vpc_cidr_block" {
  description = "The specification of the vpc cidr block."
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "chose your preferred AWS region"
  type        = string
  default     = "ap-southeast-1"    
}


variable "public_subnets" {
  description = "The specification of the public subnet ips."
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "private_subnets" {
  description = "The specification of the private subnet ips."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


variable "worker_group" {
  description = "Your workergroup name"
  type        = string
  default     = "reyekstf-WKRGRP"  
}
variable "cluster_name" {
  description = "Your cluster name"
  type        = string
  default     = "reyekstf-ClUSTER"  
}


variable "instance_type" {
  description = "The specification of worker instance type"
  type        = string
  default     = "t2.small"  
}

variable "name_prefix" {
  description = "The name prefix"
  type        = string
  default     = "reyekstf-prefix"  
}


variable "aws_profile" {
  description = "The selected aws profile name"
  type        = string
  default     = "reynaldi"  
}

variable "des_capacity" {
  description = "The desired capacity of the cluster"
  type        = number
  default     = "2"  
}




  







