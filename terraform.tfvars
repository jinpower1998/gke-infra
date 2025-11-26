gcp_region                = "europe-west1"
gcp_project_id            = "impactful-hawk-460309-v1"
gke_service_account_id    = "gke-sa"
gke_subnetwork_region     = "europe-west1"
gke_subnetwork_cdir_range = "10.10.0.0/16"
gke_cluster_name_suffix   = "cute-puppy"
gke_ip_range_pods         = "172.10.0.0/16"
gke_ip_range_services     = "192.10.0.0/22"
gke_node_count            = 1
gke_subnetwork_name       = "gke-infra-subnet"
gke_vpc_network_name      = "gke-infra-network"
iam_service_account_members = [
  "allAuthenticatedUsers"
]