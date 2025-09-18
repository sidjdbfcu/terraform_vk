terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.10.0"
        }
    }
}

provider "vkcs" {
    username = "----" #Логин пользователя ВК   
    password = "---"     #Пароль для пользователя ВК
    project_id = "----"  #ID проекта
    region = "RegionOne"
    auth_url = "https://infra.mail.ru:35357/v3/"
}
