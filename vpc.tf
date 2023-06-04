# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vpc_network" {
  project                 = local.google_project
  name                    = "${local.google_project}-vpc-network"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}
