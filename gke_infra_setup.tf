module "gke_infra_setup" {

  source = "./module/"

  cluster_name_suffix = var.gke_cluster_name_suffix
  ip_range_pods       = var.gke_ip_range_pods
  ip_range_services   = var.gke_ip_range_services
  node_count          = var.gke_node_count
  autoscaling = {
    enabled             = false
    auto_repair         = true
    auto_upgrade        = false
    autoscaling_profile = "BALANCED"
    gpu_resources       = []
  }

  region             = var.gcp_region
  project_id         = var.gcp_project_id
  network            = var.gke_vpc_network_name
  subnetwork         = var.gke_subnetwork_name
  service_account    = var.gke_service_account_id
  gce_pd_csi_driver  = true
  service_account_id = var.gke_service_account_id

  vpc_network_name = var.gke_vpc_network_name


  node_config = {
    disk_size_gb = "50"
    disk_type    = "pd-standard"
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-medium"
    workload_metadata_config = {
      mode = "GKE_METADATA"
    }
  }

  subnetwork_region     = var.gke_subnetwork_region
  subnetwork_cdir_range = var.gke_subnetwork_cdir_range
  subnetwork_name       = var.gke_subnetwork_name
  dns_cache             = true

  service_account_members = var.iam_service_account_members

}