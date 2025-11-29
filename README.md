# GKE regional Standard-Cluster

This self written Terraform module proviosions a standard regional GKE-Cluster:

[diagram](docs/images/gke-infra.png)

### resources

### structure

```
├── gke_infra_setup.tf
├── main.tf
├── module
│   ├── cloud_nat.tf
│   ├── cluster.tf
│   ├── iam.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── vpc.tf
├── outputs.tf
└── variables.tf
```