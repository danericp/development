variable "environment_tag" {
  default     = "Production"
  description = "Environment tag"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "region" {
  default = "us-east-1"
}