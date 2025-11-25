resource "google_service_account" "gke_infra_service" {
  account_id = var.service_account_id
  project    = var.project_id
}

resource "google_service_account_iam_binding" "account_iam" {
  service_account_id = google_service_account.gke_infra_service.name
  role               = "roles/iam.serviceAccountUser"

  members = var.service_account_members
}

resource "google_service_account_iam_binding" "gke_service_iam" {
  service_account_id = google_service_account.gke_infra_service.name
  role               = "roles/container.admin"

  members = var.service_account_members
}

resource "google_service_account_iam_binding" "compute_service_iam" {
  service_account_id = google_service_account.gke_infra_service.name
  role               = "roles/compute.admin"

  members = var.service_account_members
}