# default variables

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

variable "cluster_config" {
  type = object({
    enable_private_endpoint = bool
    enable_private_nodes    = bool
    master_ipv4_cidr_block  = string
    master_global_access_config = object(
      {
        enabled = bool
      }
    )
  })
  default = {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
    master_global_access_config = {
      enabled = true
    }
  }
}

variable "node_count" {
  description = "number of 3 nodes of the pool (i.E 1 = 3 nodes by default)"
  type        = number
}

variable "autoscaling" {
  type = object({
    enabled             = bool
    autoscaling_profile = string
    min_cpu_cores       = optional(number)
    max_cpu_cores       = optional(number)
    min_memory_gb       = optional(number)
    max_memory_gb       = optional(number)
    gpu_resources = list(object({
      resource_type = string,
      minimum       = number,
    maximum = number }))
    auto_repair             = bool
    auto_upgrade            = bool
    disk_size               = optional(number)
    disk_type               = optional(string)
    image_type              = optional(string)
    strategy                = optional(string)
    max_surge               = optional(number)
    max_unavailable         = optional(number)
    node_pool_soak_duration = optional(string)
    batch_soak_duration     = optional(string)
    batch_percentage        = optional(number)
    batch_node_count        = optional(number)
    enable_secure_boot      = optional(bool, false)
  enable_integrity_monitoring = optional(bool, true) })
}
variable "subnetwork_region" {}

variable "node_config" {
  type = object({
    disk_size_gb             = string
    disk_type                = string
    image_type               = string
    machine_type             = string
    workload_metadata_config = map(string)
  })
  default = {
    disk_size_gb = "100"
    disk_type    = "pd-standard"
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-medium"
    workload_metadata_config = {
      mode = "GKE_METADATA"
    }
  }
}

variable "service_account_id" {
  description = "service account id for infra"
}

variable "service_account_members" {
  type = list(string)
}
