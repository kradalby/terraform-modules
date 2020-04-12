module "tjoda" {
  source = "../single_instance"

  name                      = var.name
  vcpu                      = var.vcpu
  memory                    = var.memory
  template                  = var.template
  network_interface_address = var.ipv4
  datacenter                = "tjoda"
  datastore                 = var.datastore

  //    cluster = "10.60.0.2"
  domain                    = var.fap_no
  network_interface_gateway = "10.62.0.1"
  dns                       = ["10.62.0.1", "1.1.1.1"]
}

