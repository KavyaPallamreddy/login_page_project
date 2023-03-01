# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "~> 1.3.7"
  required_providers {
    # AWS Provider 
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
       bucket = "terraform-on-aws-eks-dev-petapp-1997"
        key    = "dev/eks-cluster/terraform.tfstate"
        region = "us-west-2"
        
        # For State Locking
        dynamodb_table = "dev-petapp-eks-cluster"  
  }
 }
  
 

# Provider Block
provider "aws" {
  region  = var.aws_region
  #profile = "default" # Defining it for default profile is Optional
}

