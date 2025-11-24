variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "cluster_name_suffix" {
  description = "A suffix to append to the default cluster name"
  default     = ""
}

variable "region" {
  description = "The region to host the cluster in"
}

variable "network" {
  description = "The VPC network to host the cluster in"
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for services"
}

variable "service_account" {
  description = "Service account to associate to the nodes in the cluster"
}

variable "dns_cache" {
  description = "Boolean to enable / disable NodeLocal DNSCache "
  default     = false
}

variable "gce_pd_csi_driver" {
  type        = bool
  description = "(Beta) Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver."
  default     = false
}
variable "vpc_network_name" {
  default     = "gcp-network"
  description = "name of the vpc network"
}

variable "subnetwork_name" {
  default     = "gcp-subnet"
  description = "name of subnetworke"
}

variable "subnetwork_cdir_range" {
  default     = "10.10.0.0/24"
  description = "cdir range of subnetwork"
}

variable "subnetwork_region" {}

variable "node_config" {
  type = object({
    disk_size_gb             = string
    disk_type                = string
    image_type               = string
    machine_type             = string
    service_account          = string
    workload_metadata_config = map(string)
  })
  default = {
    disk_size_gb    = "100"
    disk_type       = "pd-standard"
    image_type      = "COS_CONTAINERD"
    machine_type    = "e2-medium"
    service_account = "fsdfsf"
    workload_metadata_config = {
      mode = "GKE_METADATA"
    }
  }
}

variable "service_account_id" {
  description = "service account id for gke-nodes"
}

variable "service_account_members" {
  type = list(string)
}
