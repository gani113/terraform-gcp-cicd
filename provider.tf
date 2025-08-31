terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.0.1"
    }
  }
}

provider "google" {
    project = var.project
    region = var.region
    # credentials = file("keys.json")
}
