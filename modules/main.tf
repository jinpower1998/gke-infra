#provider config
provider "google" {
}

terraform {
  backend "local" {

  }
  required_version = ">= 1.3"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}