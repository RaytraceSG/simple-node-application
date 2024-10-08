variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type        = string
  default     = "azmi1-tf-keypair" # Replace with your own key pair name (without .pem extension) that you have downloaded from AWS console previously
}

variable "instance_name" {
  description = "EC2 Instance name"
  type        = string
  default     = "azmi1-nodejs-ec2"
}