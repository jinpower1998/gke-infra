resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
  project                 = var.project_id

  depends_on = [
    google_service_account.gke_infra_service,
    google_service_account_iam_binding.account_iam,
    google_service_account_iam_binding.compute_service_iam,
    google_service_account_iam_binding.gke_service_iam,
  ]
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  project       = var.project_id
  ip_cidr_range = var.subnetwork_cdir_range
  region        = var.subnetwork_region
  network       = var.vpc_network_name

  depends_on = [
    google_compute_network.vpc_network
  ]
}

# resource "google_compute_firewall" "vpc_network_fw" {
#   name    = "gke-infra-network-firewall"
#   network = google_compute_network.vpc_network.name

#   allow {
#     protocol = "icmp"
#   }

#   allow {
#     protocol = "tcp"
#     ports    = ["443", "6443", "80"]
#   }
# }