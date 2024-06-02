terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "terraform_test" {

  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t2.micro"
  key_name                    = "edna_key"
  subnet_id                   = "subnet-0b4920c47f07e1e88"
  security_groups             = ["sg-0e79e39588a526439"]
  associate_public_ip_address = true
  
  tags = {
    Name = "edna-terraform-ec2"
  }
  
    user_data = file("./userdata.sh")
    
}

output "instance_ip" {
  description = "The public IP of the Ansible node"
  value       = aws_instance.terraform_test.public_ip
}

   
      


