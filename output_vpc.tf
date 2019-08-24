output "subnet_vm" {
  value       = "${google_compute_subnetwork.subnet_vm.name}"
  description = "The URL of the created resource"
}
output "vpc_chavo" {
  value       = "${google_compute_network.vpc_chavo.name}"
  description = "The URL of the created resource"
}
