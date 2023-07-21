variable "token" {
  type        = string
  description = "The Hetzner API token"
  sensitive   = true
  validation {
    condition     = length(var.token) > 0
    error_message = "The Hetzner API token must not be empty"
  }
}

variable "tskey" {
  type        = string
  description = "The Tailscale key"
  sensitive   = true
  validation {
    condition     = length(var.tskey) > 0
    error_message = "The Tailscale key must not be empty"
  }
}

variable "node-location" {
  type        = string
  default     = "nbg1"
  description = "value for the location of the node"

  validation {
    condition     = contains(["nbg1", "fsn1", "hel1"], var.node-location)
    error_message = "Allowed values are nbg1, fsn1, hel1"
  }
}

variable "node-type" {
  type        = string
  default     = "cx11"
  description = "value for the type of the node"

  validation {
    condition     = contains(["cx11", "cx21", "cx31", "cx41", "cx51", "cx61", "cx81", "cx91"], var.node-type)
    error_message = "Allowed values are cx11, cx21, cx31, cx41, cx51, cx61, cx81, cx91"
  }

}
