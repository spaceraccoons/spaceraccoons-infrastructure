terraform {
  backend "remote" {
    organization = "spaceraccoons"

    workspaces {
      name = "spaceraccoons-infrastructure"
    }
  }
}
