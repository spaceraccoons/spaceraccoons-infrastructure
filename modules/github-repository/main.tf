resource "github_repository" "this" {

  lifecycle {
    ignore_changes = [pages]
  }

  name         = var.name
  description  = var.description
  auto_init    = false
  visibility   = "public"
  homepage_url = "https://spaceraccoons.com/"
  topics       = var.topics

  has_issues    = true
  has_downloads = true
  has_wiki      = false
  has_projects  = false

  license_template = "mpl-2.0"

}

resource "hetznerdns_record" "gh_pages_cname" {
  count   = var.gh_pages.enabled ? 1 : 0
  zone_id = var.gh_pages.hetznerdns_zone_id
  name    = var.gh_pages.cname_record_name
  value   = "spaceraccoons.github.io."
  type    = "CNAME"
  ttl     = 3600
}
