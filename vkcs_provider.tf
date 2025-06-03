terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.10.0"
        }
    }
}

provider "vkcs" {
    # Your user account.
    username = "-"

    # The password of the account
    password = "-"

    project_id = "-"

    # Region name
    region = "RegionOne"

    auth_url = "https://infra.mail.ru:35357/v3/"
}