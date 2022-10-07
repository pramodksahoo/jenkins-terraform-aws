pipeline {
  agent any
  tools {
      terraform "terraform"
  }
  options {
        ansiColor('xterm')
    }
          
  parameters {

    string(description: 'List of recipients to send email report', name: 'recipients', defaultValue: 'devopspramod100@gmail.com')
    string(description: 'repo branch_name', name: 'branch_name', defaultValue: 'main')

    
    string(name: 'Bucket_name' ,description: 'Bucket name, to store tfstate files', defaultValue: 'bucket-name')
    string(name: 'Dynamodb_table_name' ,description: 'DynamoDB table name, for locking tfstate files', defaultValue: 'table-name')
    

    string(name: 'TF_VAR_access_key' ,defaultValue: 'ACCESSKEY')
    string(name: 'TF_VAR_secret_key' ,defaultValue: 'SECRETKEY')
    //string(name: 'TF_VAR_aws_session_token' ,defaultValue: 'TOKEN')
   
    string(name: 'TF_VAR_eks_cluster_name' ,defaultValue: 'mito-cluster-development')
    string(name: 'TF_VAR_environment' ,defaultValue: 'dev')
    
    string(name: 'TF_VAR_desired_size' ,defaultValue: '3')
    string(name: 'TF_VAR_max_size' ,defaultValue: '7')
    string(name: 'TF_VAR_min_size' ,defaultValue: '3')
    string(name: 'TF_VAR_max_unavailable' ,defaultValue: '2')
    
    string(name: 'TF_VAR_instance_type' ,defaultValue: 'm5.large')

    string(name: 'TF_VAR_ami_id' ,defaultValue: 'ami-0e1b6f116a3733fef')
    
    string(name: 'TF_VAR_vpc_id' ,defaultValue: 'vpc-')
    
    string(name: 'TF_VAR_region' ,defaultValue: 'us-east-1')
    
    string(name: 'TF_VAR_subnet1' ,defaultValue: 'subnet-')
    string(name: 'TF_VAR_subnet2' ,defaultValue: 'subnet-')
    string(name: 'TF_VAR_subnet3' ,defaultValue: 'subnet-')
    
    string(name: 'TF_VAR_ec2_ssh_key' ,defaultValue: 'mito-cluster-eks-ap-south-1')
    
    string(name: 'TF_VAR_aws_lb_target_group_name' ,defaultValue: 'mito-cluster-eks-tg')
           
    string(name: 'aws_lb_internal_443_target_group_protcol', description: 'value can be TCP or TLS' ,defaultValue: 'TCP')
           
    
    string(name: 'TF_VAR_EKS_ClusterAutoscalarPolicyName' ,defaultValue: 'AmazonEKSClusterAutoscalerPolicy')// existing policy
   

    booleanParam(name: 'terraform_plan', defaultValue: false, description: 'Select to Run terraform apply command')
    booleanParam(name: 'terraform_apply', defaultValue: false, description: 'Select to Run terraform apply command')
    booleanParam(name: 'terraform_destroy', defaultValue: false, description: 'Select to Run terraform destroy command')
  }


   
   
    stages {
    stage('Checkout src') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/${branch_name}']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'LocalBranch', localBranch: "**"]], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[url: 'git@github.com:Human-Edge/mitoapp-infra.git']]])
      }
    }
      
    stage('check-policy'){
      steps {
        sh "sh check-policy.sh"

      }
    }
   
   stage('copy credentails') {
      steps {
       
        
        sh 'echo "access_key = \\"${TF_VAR_access_key}\\"" >> ./terraform.tfvars'
        sh 'echo "secret_key = \\"${TF_VAR_secret_key}\\"" >> ./terraform.tfvars'
        //sh 'echo "aws_session_token = \\"${TF_VAR_aws_session_token}\\"" >> ./terraform.tfvars'
        
        
        sh 'echo "iam_role_name_for_eks_cluster = \\"${TF_VAR_eks_cluster_name}_role\\"" >> ./terraform.tfvars'
        sh 'echo "eks_cluster_name = \\"${TF_VAR_eks_cluster_name}\\"" >> ./terraform.tfvars'
        sh 'echo "tag_name_for_cluster = \\"${TF_VAR_environment}\\"" >> ./terraform.tfvars'
        sh 'echo "iam_role_name_for_eks_nodes = \\"${TF_VAR_eks_cluster_name}_node_role\\"" >> ./terraform.tfvars'
        sh 'echo "eks_node_group_name = \\"${TF_VAR_eks_cluster_name}_nodegroup\\"" >> ./terraform.tfvars'
        
        sh 'echo "desired_size = \\"${TF_VAR_desired_size}\\"" >> ./terraform.tfvars'
        sh 'echo "max_size = \\"${TF_VAR_max_size}\\"" >> ./terraform.tfvars'
        sh 'echo "min_size = \\"${TF_VAR_min_size}\\"" >> ./terraform.tfvars'
        sh 'echo "max_unavailable = \\"${TF_VAR_max_unavailable}\\"" >> ./terraform.tfvars'
        
        sh 'echo "instance_type = \\"${TF_VAR_instance_type}\\"" >> ./terraform.tfvars'
        sh 'echo "ami_id = \\"${TF_VAR_ami_id}\\"" >> ./terraform.tfvars'
        sh 'echo "template_name = \\"${TF_VAR_eks_cluster_name}_launch_template\\"" >> ./terraform.tfvars'
        sh 'echo "instances_name = \\"${TF_VAR_eks_cluster_name}\\"" >> ./terraform.tfvars'
        
        sh 'echo "vpc_id = \\"${TF_VAR_vpc_id}\\"" >> ./terraform.tfvars'
        sh 'echo "region = \\"${TF_VAR_region}\\"" >> ./terraform.tfvars'
        sh 'echo "subnet_ids = [\\"${TF_VAR_subnet1}\\",\\"${TF_VAR_subnet2}\\",\\"${TF_VAR_subnet3}\\"]" >> ./terraform.tfvars'
        
        sh 'echo "aws_lb_target_group_name = \\"${TF_VAR_aws_lb_target_group_name}\\"" >> ./terraform.tfvars'
        sh 'echo "aws_lb_internal_443_protocl = \\"${aws_lb_internal_443_target_group_protcol}\\"" >> ./terraform.tfvars'
        
        sh 'echo "ec2_ssh_key = \\"${TF_VAR_ec2_ssh_key}\\"" >> ./terraform.tfvars'
        
        sh 'echo "oidc_role_name = \\"${TF_VAR_eks_cluster_name}_oidc_role\\"" >> ./terraform.tfvars'
        sh 'echo "policy-name = \\"${TF_VAR_EKS_ClusterAutoscalarPolicyName}\\"" >> ./terraform.tfvars'
        
        //ansible variables
        sh 'echo > ./vars.yaml' // removes previous contents
        sh 'echo "eks_cluster_name: ${TF_VAR_eks_cluster_name}" >> ./vars.yaml'
        sh 'echo "access_key: ${TF_VAR_access_key}" >> ./vars.yaml'
        sh 'echo "secret_key: ${TF_VAR_secret_key}" >> ./vars.yaml'
        sh 'echo "aws_session_token: ${TF_VAR_aws_session_token}" >> ./vars.yaml'
        sh 'echo "region: ${TF_VAR_region}" >> ./vars.yaml'
        sh 'echo "reponame: ${TF_VAR_eks_cluster_name}-repo" >> ./vars.yaml'
        
        
        
    
      }
    }
    stage('Terraform Init') {
      
      steps {
        ansiColor('xterm') {

          //sh label: '', script: 'terraform init'
          //sh label: '', script: 'terraform init -reconfigure -backend-config="access_key=${TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key}" -backend-config="token=${TF_VAR_aws_session_token}"'
          //sh label: '', script: 'terraform init -reconfigure -backend-config="access_key=${TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key}" -backend-config="token=${TF_VAR_aws_session_token}" -backend-config "key=$TF_VAR_environment/$TF_VAR_eks_cluster_name/terraform.tfstate" -backend-config "region=${TF_VAR_region}"'
          sh label: '', script: 'terraform init -reconfigure -backend-config="access_key=${TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key}" -backend-config="token=${TF_VAR_aws_session_token}" -backend-config "bucket=${Bucket_name}" -backend-config "dynamodb_table=${Dynamodb_table_name}" -backend-config "key=$TF_VAR_environment/$TF_VAR_eks_cluster_name/terraform.tfstate" -backend-config "region=${TF_VAR_region}"'

        }
      }   
    }
      
   stage('Terraform plan') {
       when{
       expression { params.terraform_plan}
     }
      steps {
        ansiColor('xterm') {
        sh label: '', script: 'terraform plan'
      }
      } 
       post {
        success {
          echo "terraform plan successful"
         
        }
        failure {
          echo "terraform plan failed"
        
        }
      }
    }
   
      
    stage('Terraform apply') {
       when{
       expression { params.terraform_apply}
     }
      steps {
        ansiColor('xterm') {
        sh label: '', script: 'terraform apply   --auto-approve'
      }
      } 
       post {
        success {
          echo "terraform apply successful"
         
        }
        failure {
          echo "terraform apply failed"
        
        }
      }
    }
   
 stage('get-role-arn'){
      steps {
        sh "sh get-role.sh"

      }
    }
 
      
    stage('Terraform destroy') {
     when{
       expression { params.terraform_destroy}
     }
      steps {
        ansiColor('xterm') {
        sh label: '', script: 'terraform destroy --auto-approve'
      }
      }
      post {
        success {
          echo "destroy successful"
         
        }
        failure {
          echo "destroy failed"
        
        }
      }
    }   
    
  }
}
      
