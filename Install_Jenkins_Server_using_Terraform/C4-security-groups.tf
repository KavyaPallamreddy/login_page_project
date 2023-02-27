#Resource-7: Create Security Group
resource "aws_security_group" "dev-vpc-sg" {
      name = "dev-vpc-default-sg"
      description = "Dec VPC Default Security Group"
      vpc_id = aws_vpc.vpc-dev.id
      ingress {
      #Allow SSH 
        description = "Allow Port 22"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      
      ingress {
      #Allow port for jenkins
        description = "Allow Port 8080"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
      
      

      egress {
        description = "Allow all IP and Ports Outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
}