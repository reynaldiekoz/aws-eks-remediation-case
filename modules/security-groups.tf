 #EKS Security group
resource "aws_security_group" "eks_cluster_sg" {
  name = var.name_prefix 
  vpc_id      = module.vpc.vpc_id

  
   ingress {
    description      = "incoming traffic only on TCP port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
 
}

