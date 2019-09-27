variable "domain" {
}

variable "sub" {
}

variable "ipv4" {
}

variable "ipv6" {
}

variable "proxied" {
  default = false
}

variable "ttl" {
  default = "120"
}

resource "cloudflare_record" "record_v4" {
  domain  = var.domain
  name    = var.sub
  value   = var.ipv4
  type    = "A"
  proxied = var.proxied
  ttl     = var.ttl
}

resource "cloudflare_record" "record_v6" {
  domain  = var.domain
  name    = var.sub
  value   = var.ipv6
  type    = "AAAA"
  proxied = var.proxied
  ttl     = var.ttl
}

