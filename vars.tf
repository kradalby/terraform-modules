variable "fap_no" {
  type    = string
  default = "6467f74f10e206068c311e586104ebe0"
}

variable "terra_datacenter" {
  type    = string
  default = "terra"
}

variable "terra_cluster" {
  type    = string
  default = "10.60.0.2"
}

variable "terra_domain" {
  type    = string
  default = "fap.no"
}

variable "terra_network_interface_gateway" {
  type    = string
  default = "10.60.0.1"
}

variable "terra_dns" {
  type    = list(string)
  default = ["10.60.0.1", "10.60.10.1"]
}

