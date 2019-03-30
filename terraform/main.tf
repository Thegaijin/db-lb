# Specify the provider (GCP)
provider "google" {
  credentials = "${file("../shared/account-terraform.json")}"
  project     = "andela-learning"
  region      = "${var.region}"
}

# Create the master db instance
resource "google_compute_instance" "db-lb-master" {
  name         = "thegaijin-test-master"
  machine_type = "g1-small"
  zone         = "${var.zone}"

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

resource "google_compute_instance" "db-lb-slave1" {
  name         = "thegaijin-test-slave1"
  machine_type = "g1-small"
  zone         = "${var.zone}"

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

resource "google_compute_instance" "db-lb-slave2" {
  name         = "thegaijin-test-slave2"
  machine_type = "g1-small"
  zone         = "${var.zone}"

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
  name         = "thegaijin-test-haproxy"
  machine_type = "g1-small"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "haproxy-image"
    }
  }

  network_interface {
    network    = "default"
    network_ip = "${var.haproxy_internal_ip}"

    access_config {
      nat_ip = "${var.haproxy_external_ip}"
    }
  }
}
