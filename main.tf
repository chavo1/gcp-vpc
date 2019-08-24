# Create VPC
#--------------------------------------
resource "google_compute_network" "vpc_chavo" {
  name                    = "vpc-chavo"
  auto_create_subnetworks = "false"
}

# Create Subnet
#--------------------------------------
resource "google_compute_subnetwork" "subnet_vm" {
  name          = "subnet-vm"
  ip_cidr_range = "${var.subnet_range}"
  network       = "${google_compute_network.vpc_chavo.self_link}"
  region        = "${var.region}"
}


# Create firewall rules
#--------------------------------------

# FW rule to allow all TCP connections in the vpc
# FW rule uses service accounts of all vpc instances
# FW rule uses service accounts for rule target
resource "google_compute_firewall" "allow_all_consul" {
  name    = "allow-internal-consul"
  network = "${google_compute_network.vpc_chavo.self_link}"
  allow {
    protocol = "all"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["consul"]
}
