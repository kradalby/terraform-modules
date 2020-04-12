variable "name" {
  type = string
}

variable "datacenter" {
  type = string
}

variable "cluster" {
  type    = string
  default = "cluster"
}

variable "vcpu" {
  type = string
}

variable "memory" {
  type = string
}

variable "domain" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "network_interface_label" {
  type    = string
  default = "Internal"
}

variable "network_interface_address" {
  type = string
}

variable "network_interface_prefix_length" {
  type    = string
  default = "24"
}

variable "network_interface_gateway" {
  type = string
}

variable "template" {
  type = string
}

variable "datastore" {
  type    = string
  default = "slow"
}

variable "disk_type" {
  type    = string
  default = "thin"
}

variable "dns" {
  type = list(string)
}

