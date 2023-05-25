locals {
  hetznerdns_ns_servers = [
    "hydrogen.ns.hetzner.com",
    "oxygen.ns.hetzner.com",
    "helium.ns.hetzner.com",
  ]

  github_domain_verifications = {
    "_github-pages-challenge-spaceraccoons"         = "1e99d7cf6810ae8dac28010512c1f9"
    "_github-pages-challenge-spaceraccoons.schemas" = "fb705081b245cc4a992999dd6cc358"
  }
}

resource "hetznerdns_zone" "this" {
  name = "spaceraccoons.com"
  ttl  = 86400
}

resource "hetznerdns_record" "apex_a" {
  for_each = var.github_pages_dns_recods.a
  zone_id  = hetznerdns_zone.this.id
  name     = "@"
  value    = each.value
  type     = "A"
  ttl      = 60 * 60 * 24
}

resource "hetznerdns_record" "apex_aaaa" {
  for_each = var.github_pages_dns_recods.aaaa
  zone_id  = hetznerdns_zone.this.id
  name     = "@"
  value    = each.value
  type     = "AAAA"
  ttl      = 60 * 60 * 24
}

resource "hetznerdns_record" "ns" {
  count   = length(local.hetznerdns_ns_servers)
  zone_id = hetznerdns_zone.this.id
  name    = "@"
  value   = "${local.hetznerdns_ns_servers[count.index]}."
  type    = "NS"
  ttl     = 60 * 60 * 24
}

resource "hetznerdns_record" "github_domain_verification" {
  for_each = local.github_domain_verifications
  zone_id  = hetznerdns_zone.this.id
  name     = each.key
  value    = each.value
  type     = "TXT"
  ttl      = 3600
}
