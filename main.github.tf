module "github_repo_main" {
  source = "./modules/github-repository"

  name        = "spaceraccoons"
  description = "We will save y0u!!!1"

  topics = concat(var.github_common_topics, [
    "game",
  ])

  gh_pages = {
    enabled            = true
    cname_record_name  = "www"
    hetznerdns_zone_id = hetznerdns_zone.this.id
  }

}

module "github_repo_schemas" {
  source = "./modules/github-repository"

  name        = "spaceraccoons-schemas"
  description = "Sources of schemas.spaceraccoons.com"

  topics = concat(var.github_common_topics, [
    "api-specification",
    "jsonschema",
    "openapi",
  ])

  gh_pages = {
    enabled            = true
    cname_record_name  = "schemas"
    hetznerdns_zone_id = hetznerdns_zone.this.id
  }

}
