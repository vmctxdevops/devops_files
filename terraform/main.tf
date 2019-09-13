
provider "google" {
  credentials = "${file("account.json")}"
  project     = "lat1516"
  region      = "us-central1-a"
}



resource "google_compute_instance" "vm_instance" {
  name         = "jenkins"
  machine_type = "n1-standard-1"
  zone    = "us-central1-a"

  tags = ["lab"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20190813"
    }
 }


 network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}

