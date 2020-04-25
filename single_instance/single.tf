data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_interface_label
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "single_instance" {
  name             = var.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vcpu
  memory           = var.memory

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.name
        domain    = "${var.datacenter}.${var.domain}"
      }

      network_interface {
        ipv4_address = var.network_interface_address
        ipv4_netmask = var.network_interface_prefix_length
      }

      dns_server_list = var.dns
      ipv4_gateway    = var.network_interface_gateway
    }
  }

  lifecycle {
    ignore_changes = [
      disk,
      resource_pool_id,
      guest_id,
      clone[0].template_uuid,
      clone[0].customize[0].dns_server_list,
    ]
  }
}

module "single_instance_dns" {
  source = "../dns_a"

  domain = var.zone_id
  sub    = "${var.name}.${var.datacenter}"
  ip     = vsphere_virtual_machine.single_instance.default_ip_address
}

