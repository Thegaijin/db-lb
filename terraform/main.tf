# Specify the provider (GCP)
provider “google” {
  credentials = “${file(“../terraform-account.json”)}”
  project = “andela-learning”
  region = “europe-west1”
}

# Create the master db instance
resource "google_compute_instance" "db-lb" {
  name = "psql-master"
  machine_type = "n1-standard-1"
  zone = "europe-west1-b"

  boot_disk {
      initialize_params {
      image = "db-lb-master"
  }
}
network_interface {
  network = "default"
  access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "db-lb" {
  name = "psql-slave1"
  machine_type = "n1-standard-1"
  zone = "europe-west1-b"

  boot_disk {
      initialize_params {
      image = "db-lb-slaves"
  }
}
network_interface {
  network = "default"
  access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "db-lb" {
  name = "psql-slave2"
  machine_type = "n1-standard-1"
  zone = "europe-west1-b"

  boot_disk {
      initialize_params {
      image = "db-lb-slaves"
  }
}
network_interface {
  network = "default"
  access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_instance" "haproxy-db-lb" {
  name = "haproxy"
  machine_type = "n1-standard-1"
  zone = "europe-west1-b"

  boot_disk {
      initialize_params {
      image = "haproxy-image"
  }
}
network_interface {
  network = "default"
  network_ip = "${var.haproxy_internal_ip}"
  access_config {
    nat_ip: "${var.haproxy_external_ip}"
    }

  }
}