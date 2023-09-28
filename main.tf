locals {

  project_id = "groovy-height-400408"

}

 

provider "google" {
  credentials = file("serviceaccount.json")

  project = local.project_id

  region  = "us-central1"

  zone    = "us-central1-b"

}

 

resource "google_project_service" "compute_service" {

  project = local.project_id

  service = "compute.googleapis.com"

}

resource "google_compute_instance" "vm_instance" {

  name         = "nginx-instance"

  machine_type = "f1-micro"

 

  tags = ["nginx-instance"]

 

  boot_disk {

    initialize_params {

      image = "centos-7-v20230912"

    }

}

  network_interface {

    network = "default"

    //access_config {

      // The "0.0.0.0/0" here allows access from any IP. Consider restricting access for security.

      //nat_ip = google_compute_address.static_ip.address

    //}

  }

 

}
