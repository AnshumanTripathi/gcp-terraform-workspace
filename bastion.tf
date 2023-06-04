# https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/2fe171500c3496eb88b9fdf83318b0927d225e4b/examples/safer_cluster_iap_bastion/bastion.tf
locals {
  bastion_name = "${local.gke_cluster.name}-bastion"
  bastion_zone = "${local.environment_config.region}-a"
}

module "bastion" {
  source  = "terraform-google-modules/bastion-host/google"
  version = "~> 5.0"

  network        = google_compute_network.vpc_network.self_link
  subnet         = google_compute_subnetwork.kubernetes_subnet.self_link
  project        = local.environment_config.google_project
  name           = local.bastion.name
  zone           = local.bastion.zone
  image_project  = "debian-cloud"
  machine_type   = "g1-small"
  startup_script = templatefile("${path.module}/templates/startup-script.tftpl", {})
  shielded_vm    = "false"
  members        = local.bastion.members
}
