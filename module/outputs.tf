# default outputs

output "endpoint" {
  sensitive   = false
  description = "The cluster endpoint"
  value       = module.gke.endpoint
}

output "ca_certificate" {
  sensitive   = true
  description = "The cluster ca certificate (base64 encoded)"
  value       = module.gke.ca_certificate
}

output "project_id" {
  description = "The project ID the cluster is in"
  value       = var.project_id
}

output "location" {
  description = "Cluster location"
  value       = module.gke.location
}

output "node_locations" {
  description = "Cluster node locations"
  value       = module.gke.node_locations
}

output "addons_config" {
  description = "The configuration for addons supported by GKE Autopilot."
  value       = module.gke.addons_config
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.cluster_name
}

output "master_version" {
  description = "The master Kubernetes version"
  value       = module.gke.master_version
}