# PoC to Setup Tailscale in Cloud VMs

## Introduction

This is a simple PoC to setup Tailscale in Cloud VMs. The PoC is based on the following assumptions:

- You have a hetzner cloud account and an API token
- You have a tailscale account and an API key
- Set have terraform installed

## Setup

1. Set the environment variabls in your shell like explained in the `.env.example` file.
2. Run the `terraform init` command to initialize terraform.
3. Run the `terraform apply -auto-approve` command to create the VMs and setup tailscale in them.
4. Wait a few seconds and the node should appear your tailscale network
5. You can now ssh into the node using the private IP address assigned by tailscale.
