# Input Variables
variable "aws_region" {
  description = "Region in which AWS resource to be created"
  type        = string
  default     = "us-west-2"

}


variable "ec2_instance_type" {
  description = "EC2 Instance type "
  type        = string
  default     = "t2.micro"

}


variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}




 