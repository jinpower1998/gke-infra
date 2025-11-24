variable "vpc_network_name" {
  type = string
}

variable "gce_pd_csi_driver" {
  type = bool
}

# variable "node_config" {
#   type = map(
#   {
#     disk_size_gb    = "100"
#     disk_type       = "pd-standard"
#     image_type      = "COS_CONTAINERD"
#     machine_type    = "e2-medium"
#     service_account = ""
#     workload_metadata_config = {
#       mode = "GKE_METADATA"
#     }
#    }
#   )
# }