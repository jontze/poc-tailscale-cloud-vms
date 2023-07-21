resource "hcloud_firewall" "fw-1" {
  name = "fw-1"

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "41641"
    description = "So Tailscale can determine the UDP port number on the far side of the NAT device, then it will make direct connections to minimize latency"
    source_ips  = ["0.0.0.0/0"]
  }
}

resource "hcloud_network" "net-1" {
  name     = "net-1"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "subnet-1" {
  network_id   = hcloud_network.net-1.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server" "node-1" {
  name         = "node-1"
  image        = "ubuntu-22.04"
  server_type  = var.node-type
  location     = var.node-location
  firewall_ids = [hcloud_firewall.fw-1.id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
  }

  network {
    network_id = hcloud_network.net-1.id
  }


  user_data = templatefile(
    "cloud-init.yaml", {
      tskey = var.tskey
    }
  )
}
