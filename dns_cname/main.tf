variable "domain" {
}

variable "sub" {
}

variable "hostname" {
}

variable "proxied" {
  default = false
}

variable "ttl" {
  default = "120"
}

resource "cloudflare_record" "record" {
  zone_id = var.domain
  name    = var.sub
  value   = var.hostname
  type    = "CNAME"
  proxied = var.proxied
  ttl     = var.ttl
}

