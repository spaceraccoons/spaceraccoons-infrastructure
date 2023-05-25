variable "github_common_topics" {
  type    = list(string)
  default = ["spaceraccoons"]
}

variable "github_pages_dns_recods" {
  type = object({
    a    = set(string)
    aaaa = set(string)
  })

  default = {
    a = [
      "185.199.108.153",
      "185.199.109.153",
      "185.199.110.153",
      "185.199.111.153",
    ]
    aaaa = [
      "2606:50c0:8000::153",
      "2606:50c0:8001::153",
      "2606:50c0:8002::153",
      "2606:50c0:8003::153",
    ]

  }

}
