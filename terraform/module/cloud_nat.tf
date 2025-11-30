# Cloud-Nat gateway for outbound traffic

resource "google_compute_router" "router" {
  name    = "gke-router"
  project = var.project_id
  region  = google_compute_subnetwork.subnetwork.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "cloud_nat" {
  name                               = "gke-router-nat"
  project                            = var.project_id
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.subnetwork
  ]
}
