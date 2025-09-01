data "google_service_account" "gcp_cicd_sa" {
    account_id = "gcp-cicd-sa"
  
}


# resource "google_service_account" "gcp_cicd_sa" {
#     account_id = "gcp-cicd-sa"
#     display_name = "gcp-cicd-sa"  
# }

resource "google_compute_instance" "jenkins_vm" {
    name = "jenkins-vm"
    machine_type = "e2-medium"
    zone = var.zone
    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-2504"
        size= 20
      }
    }

    network_interface {
      network = google_compute_network.project_vpc.self_link
      subnetwork = google_compute_subnetwork.project-vpc-subnet.self_link

      access_config {}
    }
}