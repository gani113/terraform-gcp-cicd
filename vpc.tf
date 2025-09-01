resource "google_compute_network" "project_vpc" {
    project = var.project
    name = "project-vpc"
    auto_create_subnetworks = false

    lifecycle {
      prevent_destroy = true
    }
}

resource "google_compute_subnetwork" "project-vpc-subnet" {
    name = "subnet-1"
    network = google_compute_network.project_vpc.id
    region = var.region
    ip_cidr_range = "10.2.0.0/16"
}

resource "google_compute_firewall" "allo_ssh" {
    name = "allow-ssh"
    network = google_compute_network.project_vpc.id
    source_ranges = ["0.0.0.0/0"]

    allow {
        protocol = "tcp"
      	ports = ["22"]
    }

    target_tags = [ "ssh" ]
  
}

