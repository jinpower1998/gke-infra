# root-module for defining the whole setup for gke-standard cluster

module "gke_infra_setup" {

  source = "./module/"

  region     = var.gcp_region
  project_id = var.gcp_project_id

  vpc_network_name      = var.gke_vpc_network_name
  subnetwork_region     = var.gke_subnetwork_region
  subnetwork_cdir_range = var.gke_subnetwork_cdir_range
  subnetwork_name       = var.gke_subnetwork_name
  dns_cache             = true

  cluster_name_suffix = var.gke_cluster_name_suffix
  ip_range_pods       = var.gke_ip_range_pods
  ip_range_services   = var.gke_ip_range_services
  node_count          = var.gke_node_count
  network             = var.gke_vpc_network_name
  subnetwork          = var.gke_subnetwork_name
  service_account     = var.gke_service_account_id
  gce_pd_csi_driver   = true
  service_account_id  = var.gke_service_account_id
  autoscaling = {
    enabled             = false
    auto_repair         = true
    auto_upgrade        = false
    autoscaling_profile = "BALANCED"
    gpu_resources       = []
  }

  cluster_config = {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
    master_global_access_config = {
      enabled = true
    }
  }

  node_locations = var.gke_node_locations
  node_config = {
    disk_size_gb = "50"
    disk_type    = "pd-standard"
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-medium"
    workload_metadata_config = {
      mode = "GKE_METADATA"
    }
  }

  service_account_members = var.iam_service_account_members

}