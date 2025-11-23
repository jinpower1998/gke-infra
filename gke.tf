module "gke_setup_local" {
  source = "./modules/"

  region            = ""
  project_id        = ""
  network           = var.vpc_network
  service_account   = ""
  gce_pd_csi_driver = ""
  subnetwork        = ""
  ip_range_pods     = ""
  ip_range_services = ""
}