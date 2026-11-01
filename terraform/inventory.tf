resource "local_file" "inventory" {
  filename = "/home/linu/netfops/net-fops-hw-14-5/ansible/hosts.ini"
  content  = <<-XYZ

  [workers]
  worker1 ansible_host=${yandex_compute_instance.worker1.network_interface[0].nat_ip_address}
  worker2 ansible_host=${yandex_compute_instance.worker2.network_interface[0].nat_ip_address}

  [managers]
  manager1 ansible_host=${yandex_compute_instance.manager1.network_interface[0].nat_ip_address}
  
  XYZ
  
}