variable "aws_region" {
  description = "select the region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ubuntu ID identifier you can get it from the console"
  type        = string
  default     = "ami-091138d0f0d41ff90"
}

variable "ec2_type" {
  description = "the size of the ec2 instance"
  type        = string
  default     = "t3.micro"
}