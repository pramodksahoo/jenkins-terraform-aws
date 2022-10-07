resource "aws_security_group_rule" "tcp1" {
  
   for_each           = local.my_rules  

   from_port = each.value.port
   to_port = each.value.port
   cidr_blocks = each.value.cidrs

   protocol = "tcp"
   type               = "ingress"    
   security_group_id  = var.aws_eks_cluster_sg_id
}


locals {
    my_rules = merge([
            for idx_port, ports in var.ingress_ports_tcp:
                   { for port in ports:
                          "${idx_port}-${port}" => {
                              "port" = port
                              "cidrs" = var.ingress_cidr_tcp[idx_port]
                      }
                   }  
        ]...)
}

