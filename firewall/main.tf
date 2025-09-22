resource "google_compute_firewall" "fir" {
    name = var.name
    network = var.network_name
    direction = "INGRESS"
    allow {
      ports = ["22","80"]
      protocol = "tcp"
    }
    source_ranges = ["0.0.0.0/0"]
}