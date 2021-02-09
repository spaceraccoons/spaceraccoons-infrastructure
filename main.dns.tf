locals {
  hetznerdns_ns_servers = [
    "helium.ns.hetzner.com",
    "hydrogen.ns.hetzner.com",
    "oxygen.ns.hetzner.com",
  ]

  github_domain_verifications = {
    "_github-challenge-spaceraccoons"         = "b469e022ce"
    "_github-challenge-spaceraccoons.api"     = "13079d421e"
    "_github-challenge-spaceraccoons.blog"    = "ac0aef81b0"
    "_github-challenge-spaceraccoons.news"    = "2a8148c30c"
    "_github-challenge-spaceraccoons.play"    = "49cb16517e"
    "_github-challenge-spaceraccoons.schemas" = "4cbe5a794e"
    "_github-challenge-spaceraccoons.shop"    = "2fb5c15776"
    "_github-challenge-spaceraccoons.www"     = "f1fe2b7773"
  }
}

resource "hetznerdns_zone" "this" {
  name = "spaceraccoons.com"
  ttl  = 86400
}

resource "hetznerdns_record" "ns" {
  for_each = toset(local.hetznerdns_ns_servers)
  zone_id  = hetznerdns_zone.this.id
  name     = "@"
  value    = "${each.key}."
  type     = "NS"
  ttl      = 86400
}

resource "hetznerdns_record" "github_domain_verification" {
  for_each = local.github_domain_verifications
  zone_id  = hetznerdns_zone.this.id
  name     = each.key
  value    = each.value
  type     = "TXT"
  ttl      = 3600
}
