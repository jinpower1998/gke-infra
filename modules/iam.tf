resource "google_service_account" "gke_node_service" {
  account_id = var.service_account_id
}

resource "google_service_account_iam_binding" "gke_node_service_iam" {
  service_account_id = google_service_account.gke_node_service.name
  role               = "roles/iam.serviceAccountUser"

  members = var.service_account_members
}