variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "instance_count" {
  default = 2
}

variable "ami_id" {
  default = "ami-05cf1e9f73fbad2e2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-key"
}

variable "environment" {
  default = "dev"
}