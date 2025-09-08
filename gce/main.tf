resource "google_compute_instance" "vm" {
    name =  var.vm_name
    zone = var.zone
    machine_type =  var.machine_type
    boot_disk {
      initialize_params {
        image = "debian-12"
      }
    }
    network_interface {
      subnetwork = var.subnet_id
      access_config {
        
      }
    }
  
}

