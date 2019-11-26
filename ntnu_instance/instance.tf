module "ntnu" {
  source = "../single_instance"

  name                      = var.name
  vcpu                      = var.vcpu
  memory                    = var.memory
  template                  = var.template
  network_interface_address = var.ipv4
  datacenter                = "ntnu"

  //    cluster = "10.60.10.2"
  domain                    = "fap.no"
  network_interface_gateway = "10.61.0.1"
  dns                       = ["10.61.0.1", "10.60.0.1"]
}

