# EKS cluster setup
This script creates an EKS Cluster.

This Jenkins job will: </br>

 Creates 4 Target groups ( 2 for internal and 2 for external load balancers for ports 30080 and 30443).
 Creates an EKS cluster.
 Attches 4 target group to cluster's ASG.
 Deploy ingress-nginx controller, cluster autoscaler, k8s dashboard using helm repo.

### Prerequisite:

1. An AMI
2. A S3 bucket
3. A DynamoDB table with **LockID** as partion key of type string.

### Note:github url to create s3 bucket and dynamodb table: 

# Instruction to run Jenkins job.

1. Create a jenkins job.
2. **Update below parameters in the jenkins job** </br>
       - email       </br>
       - branch      </br>
       - bucket_name                      </br>
       - dynamoDB_table_name              </br>
       - eks_cluster_name   &nbsp;&nbsp;  </br>
       - tag_name_for_cluster                  </br>
       - desired_size        </br>
       - max_size                  </br>
       - min_size                  </br>
       - max_unavailable            </br>
       - instance_type                  </br>
       - region                          </br>
       - subnet_ids                       </br>
       - ec2_ssh_key                </br>
       - vpc_id                    </br>
       - sg_name                   </br>
       - aws_access_key_id               </br>
       - aws_secret_access_key                </br>
       - aws_session_token                </br>
       - target group name                </br>

3. Select **terraform apply** option to create the resources. <br />
To destory the resources that are created , select **terraform destroy** option <br/>
 


