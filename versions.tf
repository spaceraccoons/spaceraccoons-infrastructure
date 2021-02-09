terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.4.0"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "1.1.1"
    }
  }
  required_version = ">= 0.14"
}
