variable "vkcs_username" {
  type        = string
  description = "-" #mail
}

variable "vkcs_project_id" {
  type        = string
  sensitive   = true
  description = "259eb7c6129a46f6b01062f53d57b9f8" 
}

variable "key_pair_name" { 
  type    = string
  default = "vk-cloud-key"
}

variable "public_key_path" { 
  type    = string
  default = "C:/Users/Sofy/.ssh/id_rsa.pub"
}

variable "compute_flavor" {
  type    = string
  default = "STD2-2-2"
}

variable "vkcs_password" { 
  type        = string
  sensitive   = true
  description = "Password for VK Cloud provider authentication"
}
