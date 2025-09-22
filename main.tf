provider "google" {
    project = var.project_id
    region = var.region
}


module "vpc" {
    source = "./vpc"
    vpc_name = var.vpc_new1
}

module "subnetwork" {
    source = "./subnet"
    subnet_name = var.subnet_name
    region =  var.region
    ip_cidr =  var.ip_cidr
    network = module.vpc.vpc_id
    depends_on = [ module.vpc ]

}

module "gce" {
    source = "./gce"
    vm_name =  var.vm_name
    zone =  var.zone
    machine_type =  var.machine_type
    subnet_id = module.subnetwork.subnet_id
    depends_on = [ module.vpc,module.subnetwork ]
}

module "firewall" {
    source = "./firewall"
    name = var.firewall_name
    network_name = module.vpc.vpc_id 
  
}