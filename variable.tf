variable "HTOKEN" {
  type      = string
  sensitive = true
}

variable "TSAPIKEY" {
  type      = string
  sensitive = true
}

variable "TSORG" {
  type        = string
  description = "The Tailscale organization"
  sensitive   = false
}
