data "vkcs_images_image" "compute" {
  visibility = "public"
  default    = true
  properties = {
    mcs_os_distro  = "ubuntu"
    mcs_os_version = "22.04"
  }
}

resource "vkcs_compute_keypair" "terraform_key" {
  name       = "terraform-keypair"
  public_key = file("C:/Users/Sofy/.ssh/id_rsa.pub")
}

resource "vkcs_networking_floatingip" "fip_1" {
  pool = "ext-net"
}

resource "vkcs_networking_floatingip" "fip_2" {
  pool = "ext-net"
}

resource "vkcs_compute_instance" "terraform_instance_1" {
  name               = "ITHUBterraforubuntu1-Leskina"
  image_id           = data.vkcs_images_image.compute.id
  flavor_id          = "467c1b72-a6a2-4375-9cca-078cdc5bfdde"
  security_group_ids = [vkcs_networking_secgroup.main_sg.id]
  availability_zone  = "MS1"
  key_pair           = vkcs_compute_keypair.terraform_key.name

  block_device {
    uuid                  = data.vkcs_images_image.compute.id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 10
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid        = vkcs_networking_network.terraform_network.id
    fixed_ip_v4 = "192.168.254.100"
  }

  user_data = <<-EOF
    #cloud-config
    users:
      - name: ubuntu
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh-authorized-keys:
          - ${file("C:/Users/Sofy/.ssh/id_rsa.pub")}
    EOF
}

resource "vkcs_compute_floatingip_associate" "fip_assoc_1" {
  floating_ip = vkcs_networking_floatingip.fip_1.address
  instance_id = vkcs_compute_instance.terraform_instance_1.id
}

resource "vkcs_compute_instance" "terraform_instance_2" {
  name               = "ITHUBterraforubuntu2-Leskina"
  image_id           = data.vkcs_images_image.compute.id
  flavor_id          = "467c1b72-a6a2-4375-9cca-078cdc5bfdde"
  security_group_ids = [vkcs_networking_secgroup.main_sg.id]
  availability_zone  = "GZ1"
  key_pair           = vkcs_compute_keypair.terraform_key.name

  block_device {
    uuid                  = data.vkcs_images_image.compute.id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 10
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid        = vkcs_networking_network.terraform_network.id
    fixed_ip_v4 = "192.168.254.200"
  }

  user_data = <<-EOF
    #cloud-config
    users:
      - name: ubuntu
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh-authorized-keys:
          - ${file("C:/Users/Sofy/.ssh/id_rsa.pub")}
    EOF
}

resource "vkcs_compute_floatingip_associate" "fip_assoc_2" {
  floating_ip = vkcs_networking_floatingip.fip_2.address
  instance_id = vkcs_compute_instance.terraform_instance_2.id
}

output "instance_1_info" {
  value = {
    host_name  = vkcs_compute_instance.terraform_instance_1.name
    private_ip = vkcs_compute_instance.terraform_instance_1.network[0].fixed_ip_v4
    public_ip  = vkcs_networking_floatingip.fip_1.address
  }
}

output "instance_2_info" {
  value = {
    host_name  = vkcs_compute_instance.terraform_instance_2.name
    private_ip = vkcs_compute_instance.terraform_instance_2.network[0].fixed_ip_v4
    public_ip  = vkcs_networking_floatingip.fip_2.address
  }
}