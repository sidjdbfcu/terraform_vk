terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.10.0"
        }
    }
}

provider "vkcs" {
    username = "-"
    password = "-"
    project_id = "-"
    region = "RegionOne"
    auth_url = "https://infra.mail.ru:35357/v3/"
}
