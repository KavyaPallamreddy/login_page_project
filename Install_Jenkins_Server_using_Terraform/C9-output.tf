output "ec2_instance_publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.jenkins_server[*].public_ip
    }

output "ec2_publicdns" {
    description = "Public DNS URL of an ec2 Instance"
    value = aws_instance.jenkins_server[*].public_dns
    #sensitive = true
    }    