# gke cluster definition through modules
# sourced from, module: https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/v41.0.2/examples/gke_standard_cluster

locals {
  default_workload_pool = "${var.project_id}.svc.id.goog"
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

data "google_compute_subnetwork" "subnetwork" {
  name    = var.subnetwork
  project = var.project_id
  region  = var.region

  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.subnetwork,
    google_service_account_iam_binding.account_iam
  ]
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/gke-standard-cluster"
  version = "~> 41.0"

  project_id = var.project_id
  name       = var.cluster_name_suffix
  location   = var.region
  network    = var.vpc_network_name

  subnetwork = var.subnetwork_name

  ip_allocation_policy = {
    cluster_ipv4_cidr_block  = var.ip_range_pods
    services_ipv4_cidr_block = var.ip_range_services
  }

  private_cluster_config = var.cluster_config

  deletion_protection      = false
  remove_default_node_pool = true

  workload_identity_config = {
    workload_pool = local.default_workload_pool
  }

  master_authorized_networks_config = {
    cidr_blocks = [{
      cidr_block   = data.google_compute_subnetwork.subnetwork.ip_cidr_range
      display_name = "VPC"
      },
      {
        cidr_block   = "0.0.0.0/0"
        display_name = "outbound"
      }
    ]
  }

  addons_config = {
    dns_cache_config = {
      enabled = var.dns_cache
    }

    gce_persistent_disk_csi_driver_config = {
      enabled = var.gce_pd_csi_driver
    }
  }

  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.subnetwork,
    google_service_account_iam_binding.account_iam
  ]
}

module "node_pool" {
  source         = "terraform-google-modules/kubernetes-engine/google//modules/gke-node-pool"
  version        = "~> 41.0"
  node_count     = var.node_count
  autoscaling    = var.autoscaling
  node_locations = var.node_locations

  project_id  = var.project_id
  location    = var.region
  cluster     = module.gke.cluster_name
  node_config = var.node_config

  depends_on = [
    google_compute_network.vpc_network,
    google_compute_subnetwork.subnetwork,
    google_service_account_iam_binding.account_iam
  ]
}