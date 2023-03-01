# Input Variables
variable "aws_region" {
  description = "Region in which AWS resource to be created"
  type        = string
  default     = "us-west-2"

}

#Environment Variables

variable "environment" {
    description = "Environment Variables used as a prefix"
    type = string
    default = "dev"
}


#Business Division
variable "business_division" {
    description = "Business Division in the large organization"
    type = string
    default = "SAP"
}



 