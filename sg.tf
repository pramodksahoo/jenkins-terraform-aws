module "security_group_ports" {
  source = "./eks_cluster_sg_ports" # path to the module which has terraform script to create sg
  aws_eks_cluster_sg_id = data.aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
  ingress_ports_tcp = var.ports
  ingress_cidr_tcp = var.cidr
}

