variable "domain" {
}

variable "sub" {
}

variable "ip" {
}

variable "proxied" {
  default = false
}

variable "ttl" {
  default = "120"
}

resource "cloudflare_record" "record" {
  zone_id  = var.domain
  name    = var.sub
  value   = var.ip
  type    = "AAAA"
  proxied = var.proxied
  ttl     = var.ttl
}

