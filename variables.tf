variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "expected_account_id" {
  type    = string
  default = "860350045306"
}

variable "student_name" {
  type    = string
  default = "Shivang"
}

variable "bastion_ingress_cidr" {
  type        = string
  description = "Your current public IPv4 address in /32 notation"

  validation {
    condition     = can(cidrhost(var.bastion_ingress_cidr, 0)) && endswith(var.bastion_ingress_cidr, "/32")
    error_message = "Set your current public IPv4 in /32 notation."
  }
}

variable "key_pair_name" {
  type    = string
  default = "ewb-lab"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "enable_peering" {
  type    = bool
  default = false
}
