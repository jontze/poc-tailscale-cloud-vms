terraform {
  backend "local" {

  }

  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.13.7"
    }
  }
}

provider "tailscale" {
  api_key = var.TSAPIKEY
  tailnet = var.TSORG
}

resource "tailscale_tailnet_key" "auth_key" {
  reusable      = false
  ephemeral     = true
  preauthorized = true
  expiry        = 3600

}


module "hetzner" {
  source = "./modules/hetzner"

  token = var.HTOKEN
  tskey = tailscale_tailnet_key.auth_key.key
}
