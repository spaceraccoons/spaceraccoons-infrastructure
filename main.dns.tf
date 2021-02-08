locals {
  hetznerdns_ns_servers = [
    "helium.ns.hetzner.de",
    "hydrogen.ns.hezner.de",
    "oxygen.ns.hetzner.de",
  ]
}

resource "hetznerdns_zone" "this" {
  name = "spaceraccoons.com"
  ttl  = 86400
}

resource "hetznerdns_record" "ns" {
  for_each = toset(local.hetznerdns_ns_servers)
  zone_id  = hetznerdns_zone.this.id
  name     = "@"
  value    = "{each.key}."
  type     = "NS"
  ttl      = 86400
}
