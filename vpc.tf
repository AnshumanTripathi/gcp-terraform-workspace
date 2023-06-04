# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vpc_network" {
  project                 = local.environment_config.google_project
  name                    = "${local.environment_config.google_project}-vpc-network"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "kubernetes_subnet" {
  name                     = "kubernetes-subnet"
  ip_cidr_range            = "10.0.0.0/20"
  region                   = local.environment_config.region
  network                  = google_compute_network.vpc_network.id
  project                  = local.environment_config.google_project
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.0.16.0/21"
  }
  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.0.24.0/22"
  }
  secondary_ip_range {
    range_name    = "control-plane"
    ip_cidr_range = "10.0.28.0/28"
  }
}
