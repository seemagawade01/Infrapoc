locals {
  project_id = "ascendant-quest-400509"
}

resource "google_project_service" "compute_service" {
  project = local.project_id
  service = "compute.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager_service" {
  project = local.project_id
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_compute_instance" "vm_instance" {
  name         = "nginx-instance"
  machine_type = var.linux_instance_type
  tags = ["nginx-instance"]
  boot_disk {
    initialize_params {
      image = var.cis-rhel-8-lvl-1
    }
}

  network_interface {
    network = "default"
} 

}
