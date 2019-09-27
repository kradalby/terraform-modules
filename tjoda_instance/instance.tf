module "tjoda" {
    source = "../single_instance"

    name = "${var.name}"
    vcpu = "${var.vcpu}"
    memory = "${var.memory}"
    template = "${var.template}"
    network_interface_address = "${var.ipv4}"
    datacenter = "tjoda"
    datastore = "${var.datastore}"
//    cluster = "10.60.0.2"
    domain = "fap.no"
    network_interface_gateway = "192.168.1.1"
    dns = ["192.168.1.1", "1.1.1.1"]
}
