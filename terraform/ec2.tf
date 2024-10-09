module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name = var.instance_name

  ami                         = data.aws_ami.aws_ami_data.id
  key_name                    = var.key_name
  instance_type               = var.instance_type
  vpc_security_group_ids      = [data.aws_security_group.vpc_sg_data.id]
  subnet_id                   = data.aws_subnet.public_subnet_data.id
  associate_public_ip_address = true
  user_data                   = file("init.sh")
  tags = {
    Name = var.instance_name
  }
}

data "aws_subnet" "public_subnet_data" {
  filter {
    name   = "tag:Name"
    values = ["luqman-vpc-tf-module-public-us-east-1a"]

  }
}

data "aws_security_group" "vpc_sg_data" {
  filter {
    name   = "group-name"
    values = ["luqman-sg-allow-http-https-ssh-from-anywhere-tf-module"]
  }
}

data "aws_ami" "aws_ami_data" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}