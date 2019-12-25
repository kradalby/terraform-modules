provider "opnsense" {
  alias = "terra"
}

provider "opnsense" {
  alias = "tjoda"
}

provider "opnsense" {
  alias = "ntnu"
}

variable public_key {
  type = string
}
variable name {
  type = string
}
variable tunnel_address {
  type = list(string)
}

resource "opnsense_wireguard_client" "opnsense_wireguard_client_terra" {
  provider       = opnsense.terra
  enabled        = true
  name           = var.name
  tunnel_address = var.tunnel_address
  public_key     = var.public_key
  shared_key     = ""
  keep_alive     = 21
}
resource "opnsense_wireguard_client" "opnsense_wireguard_client_tjoda" {
  provider       = opnsense.tjoda
  enabled        = true
  name           = var.name
  tunnel_address = var.tunnel_address
  public_key     = var.public_key
  shared_key     = ""
  keep_alive     = 21
}
resource "opnsense_wireguard_client" "opnsense_wireguard_client_ntnu" {
  provider       = opnsense.ntnu
  enabled        = true
  name           = var.name
  tunnel_address = var.tunnel_address
  public_key     = var.public_key
  shared_key     = ""
  keep_alive     = 21
}
