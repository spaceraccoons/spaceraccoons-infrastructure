terraform {
  backend "remote" {
    organization = "spaceraccoons"

    workspaces {
      name = "default"
    }
  }
}
