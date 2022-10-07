variable aws_eks_cluster_sg_id{
type = string

}
variable "ingress_ports_tcp" {
    #default = [[22], [443,80]]
}

# example with some CIDRs
variable "ingress_cidr_tcp" {
   # default = [["172.31.32.0/20", "172.31.64.0/20", "172.31.96.0/20"], 
    #           ["172.31.128.0/20", "172.31.160.0/20"]]
}


