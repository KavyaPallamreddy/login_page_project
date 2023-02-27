resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.ec2_instance_type
  key_name               = var.instance_keypair
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [ aws_security_group.dev-vpc-sg.id ]
  
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_instance_profile.name}"
    
  
  
  tags = {
    "Name" = "jenkins_server"
    }
  
  connection {
        type = "ssh"
        host = "${self.public_ip}"
        user = "ec2-user"
        password = ""
        private_key = file("private-key/terraform-key.pem")
  }  
  
  provisioner "remote-exec" {
        inline = [
          "sudo amazon-linux-extras install ansible2 -y",
          "sudo yum install git -y",
          "git clone https://github.com/KavyaPallamreddy/jenkins_setup_ansible.git /tmp/Jenkins_ansibe_role",
          
          "ansible-playbook  /tmp/Jenkins_ansibe_role/playbook.yaml",
         
          

        ]
      }
  
  }
      
      








 

  
  

  
  
  
 
  