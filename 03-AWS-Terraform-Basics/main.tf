
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_pro_server" {
  ami           = var.ami_id
  instance_type = var.ec2_type
  
  tags = {
    Name = "Mustapha-Terraform-Project"
  }
}