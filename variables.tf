variable "vkcs_username" {
  type        = string
  description = "-" #mail
}

variable "vkcs_project_id" {
  type        = string
  sensitive   = true
  description = "259eb7c6129a46f6b01062f53d57b9f8" #выбор проекта, настройки проекта, доступ по API
}

variable "key_pair_name" { #не меняй
  type    = string
  default = "vk-cloud-key"
}

variable "public_key_path" { #не меняй нужен ключ
  type    = string
  default = "C:/Users/Sofy/.ssh/id_rsa.pub"
}

variable "compute_flavor" { #NE MENAY
  type    = string
  default = "STD2-2-2"
}

variable "vkcs_password" { # sam sprosit parol ne menay
  type        = string
  sensitive   = true
  description = "Password for VK Cloud provider authentication"
}