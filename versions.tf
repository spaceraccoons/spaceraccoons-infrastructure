terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 5.25.0"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = ">= 2.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1"
    }
  }
  required_version = ">= 1.4"
}
