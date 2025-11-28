# VPC network + subnet for gke-cluster

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
  project                 = var.project_id
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
