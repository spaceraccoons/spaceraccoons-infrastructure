variable "name" {
  description = "Name of the repository."
  type        = string
}

variable "description" {
  description = "description of the repository."
  type        = string
}

variable "topics" {
  description = "Topics (tags) to be attached to the repository."
  type        = list(string)
  default     = []
}

variable "gh_pages" {
  type = object({
    enabled            = bool
    cname_record_name  = string
    hetznerdns_zone_id = string
  })
  default = {
    enabled            = false
    cname_record_name  = ""
    hetznerdns_zone_id = ""
  }
}
