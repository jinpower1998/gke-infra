# IAM-binding and serviceaccounts for managaging the cluster and nodes

resource "google_service_account" "gke_infra_service" {
  account_id   = var.service_account_id
  project      = var.project_id
  display_name = "Account for GKE-Infra"
}

resource "google_service_account_iam_binding" "account_iam" {
  service_account_id = google_service_account.gke_infra_service.name
  role               = "roles/iam.serviceAccountUser"

  members = var.service_account_members
}

resource "google_project_iam_member" "gke_compute" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = google_service_account.gke_infra_service.member
}

resource "google_project_iam_member" "gke_container" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = google_service_account.gke_infra_service.member
}