variable "iam_role_name_for_eks_cluster"{
type = string
description = "IAM role name of the EKS Cluster"  
}

variable "eks_cluster_name"{
type = string
description = "Name of the EKS cluster"  
}

variable "subnet_ids"{
type = list(string)
description = "List of Subnet ids"  
}

variable "template_name"{
type = string
description = "ami id which has nexus certificates"
}

variable "instances_name"{
type = string
description = "name to worker nodes"
}

variable "ami_id"{
type = string
description = "ami id which has certificates"
}

variable "tag_name_for_cluster"{
type = string
description = "Tags"  
}

variable "iam_role_name_for_eks_nodes"{
type = string
description = "IAM role name of the EKS Node group"   
}


variable "eks_node_group_name"{
type = string 
description = "Node group name" 
}


variable "instance_type"{
type = string
description = "Instance type"  
}

variable "ec2_ssh_key"{
type = string
description = "Name of the Pem key to login to the nodes."  
}

variable "desired_size"{
type = number
}


variable "max_size"{
type = number
}

variable "min_size"{
type = number
}

variable  "max_unavailable"{
type = number
}

variable "region"{
type = string
description = "Region where cluster need to be created"  
}
variable "oidc_role_name" {
  description = "The role name."
  type        = string
}
variable "EKS_ClusterAutoscalarPolicyARN"{
type = string
default = "-1"	
}

variable "eks_sa_namespace" {
  description = "The k8s service account namespace to allow assume from."
  type        = string
}

variable "eks_sa_name" {
  description = "The k8s service account name to allow assume from."
  type        = string
}
variable "access_key" {    
  type = string
}

variable "secret_key" {    
  type = string
}

variable vpc_id {
   type = string
   description = "vpc id"
}	

variable "policy-count"{
type = string
default = "-1"
description = "check policy exists or not"
}

variable "policy-name"{
type = string
# default = "create-policy"
description = "creates policy if not exists"
}	


variable "ports"{
  default = [[30080,8443,30443,443,22]]
}

variable "cidr"{
   default = [["20.1.0.0/16"]]
}

variable "aws_lb_target_group_name"{
type = string 
description = "target group name" 
}

variable "aws_lb_internal_443_protocl"{
type = string 
description = "proctol for internal target group for port 443. cab be TCP or TLS" 
}
