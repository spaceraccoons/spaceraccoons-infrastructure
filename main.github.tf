module "github_repo_schemas" {
  source = "./modules/github-repository"

  name        = "spaceraccoons-schemas"
  description = "Sources of schemas.spaceraccoons.com"

  topics = [
    "spaceraccoons",
    "jsonschema",
    "api-specification",
  ]

  gh_pages = {
    enabled            = true
    cname_record_name  = "schemas"
    hetznerdns_zone_id = hetznerdns_zone.this.id
  }

}
