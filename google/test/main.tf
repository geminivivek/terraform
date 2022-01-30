terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "webserver" {
  name = "myfirstvm"
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = "management-vpc"
    subnetwork = "test"
    access_config {
    }
  }
}
