module "ntnu" {
  source = "../single_instance"

  name                      = var.name
  vcpu                      = var.vcpu
  memory                    = var.memory
  template                  = var.template
  network_interface_address = var.ipv4
  datacenter                = "ntnu"
  datastore                 = var.datastore

  //    cluster = "10.60.0.2"
  zone_id                   = var.fap_no
  domain                    = "fap.no"
  network_interface_gateway = "10.61.0.1"
  dns                       = ["10.61.0.1"]
}

