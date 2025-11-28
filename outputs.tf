output "endpoint" {
  sensitive = false
  value     = module.gke_infra_setup.endpoint
}

output "project_id" {
  value = module.gke_infra_setup.project_id
}

output "location" {
  value = module.gke_infra_setup.location
}

output "node_locations" {
  value = module.gke_infra_setup.node_locations
}

output "cluster_name" {
  value = module.gke_infra_setup.cluster_name
}

output "master_version" {
  value = module.gke_infra_setup.master_version
}
