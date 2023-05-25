terraform {
  cloud {
    organization = "spaceraccoons"
    workspaces {
      name = "spaceraccoons-infrastructure"
    }
  }
}
