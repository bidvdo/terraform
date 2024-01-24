
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}

data "aws_eks_cluster_auth" "this" {
  # name = module.eks.cluster_id
  name = "k8s-lab"
}


module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.21"

  cluster_name    = "k8s-lab"
  cluster_version = "1.27"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = "vpc-0298a5c5a879a6b64"
  subnet_ids               = ["subnet-016c07d4a46596ee9", "subnet-0696084ba2bc10b45", "subnet-0d5b0a5a32e8f6d88"]
  control_plane_subnet_ids = ["subnet-016c07d4a46596ee9", "subnet-0696084ba2bc10b45", "subnet-0d5b0a5a32e8f6d88"]


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
  }

  eks_managed_node_groups = {
    k8s-workers = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::610878145217:user/admin"
      username = "admin"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::610878145217:user/admin"
      username = "admin"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    "610878145217",
  ]

  tags = {
    Environment = "lab"
    Terraform   = "true"
  }
}
