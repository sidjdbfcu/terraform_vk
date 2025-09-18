terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
            version = "~> 0.10.0"
        }
    }
}

provider "vkcs" {
    username = "LeskinaSM22@st.ithub.ru"
    password = "400160MKnU8AVJ/"
    project_id = "259eb7c6129a46f6b01062f53d57b9f8"
    region = "RegionOne"
    auth_url = "https://infra.mail.ru:35357/v3/"
}