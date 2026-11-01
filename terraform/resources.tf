data "yandex_iam_service_account" "ig_sa" {
  name = var.service_account
}

data "yandex_compute_image" "ubuntu_2404_lts" {
  family = "ubuntu-2404-lts"
}


resource "yandex_compute_instance" "worker1" {
  name        = "worker1"
  hostname    = "worker1"
  zone        = "ru-central1-d"
  platform_id = "standard-v2"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404_lts.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public_sub.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.sg.id]
  }


  metadata = {
    user-data          = templatefile("./cloud-init.tftpl", {
      ubuntu_user          = var.ubuntu_user
      ssh_public_key       = var.ssh_public_key
    })
    serial-port-enable = "1"
  }
}


resource "yandex_compute_instance" "worker2" {
  name        = "worker2"
  hostname    = "worker2"
  zone        = "ru-central1-d"
  platform_id = "standard-v2"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404_lts.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public_sub.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.sg.id]
  }


  metadata = {
    user-data          = templatefile("./cloud-init.tftpl", {
      ubuntu_user          = var.ubuntu_user
      ssh_public_key       = var.ssh_public_key
    })
    serial-port-enable = "1"
  }
}

resource "yandex_compute_instance" "manager1" {
  name        = "manager1"
  hostname    = "manager1"
  zone        = "ru-central1-d"
  platform_id = "standard-v2"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404_lts.image_id
      type     = "network-hdd"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.public_sub.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.sg.id]
  }


  metadata = {
    user-data          = templatefile("./cloud-init.tftpl", {
      ubuntu_user          = var.ubuntu_user
      ssh_public_key       = var.ssh_public_key
    })
    serial-port-enable = "1"
  }
}