resource "google_compute_subnetwork" "subnet" {
    name =  var.subnet_name
    network =  var.network
    ip_cidr_range =  var.ip_cidr
    region = var.region
  
}

