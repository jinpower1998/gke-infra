module "gke_setup_local" {

  source = "./modules/"

  subnetwork_region = ""
  region            = ""
  project_id        = ""
  network           = var.vpc_network_name
  vpc_network_name  = "gke_network"
  service_account   = ""
  gce_pd_csi_driver = false
  subnetwork        = ""
  ip_range_pods     = ""
  ip_range_services = ""

}