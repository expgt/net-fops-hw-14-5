output "worker1_public_ip" {
  value       = yandex_compute_instance.worker1.network_interface[0].nat_ip_address
}

output "worker2_public_ip" {
  value       = yandex_compute_instance.worker2.network_interface[0].nat_ip_address
}

output "manager1_public_ip" {
  value       = yandex_compute_instance.manager1.network_interface[0].nat_ip_address
}