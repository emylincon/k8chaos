variable "key_name" {
  type        = string
  description = "key name for key_pair"
  default     = "work-mac"
}

variable "cidr" {
  type        = string
  description = "my network cidr"
}

variable "az" {
  type        = string
  description = "availability zone"
  default     = "eu-central-1a"
}

variable "public_subnet_name" {
  type    = string
  default = "default-subnet-public1-eu-central-1a"
}

variable "vpc_name" {
  type    = string
  default = "default-vpc"
}
