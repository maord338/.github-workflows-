variable "region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for main VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  default     = "ami-0c02fb55956c7d316"
}
