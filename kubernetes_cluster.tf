# https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/v26.1.1#terraform-kubernetes-engine-module
module "kubernetes-engine" {
  # Cluster config
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"
  version                         = " ~> 26.1.1"
  name                            = local.gke_cluster.name
  project_id                      = local.environment_config.google_project
  region                          = local.environment_config.region
  regional                        = true
  enable_private_endpoint         = false
  # Network config
  ip_range_pods                   = google_compute_subnetwork.kubernetes_subnet.secondary_ip_range[0].range_name
  ip_range_services               = google_compute_subnetwork.kubernetes_subnet.secondary_ip_range[1].range_name
  master_ipv4_cidr_block          = "10.1.0.0/28"
  network                         = google_compute_network.vpc_network.name
  subnetwork                      = google_compute_subnetwork.kubernetes_subnet.name
  # Node pool config
  initial_node_count              = 2
  default_max_pods_per_node       = 64
#  compute_engine_service_account  = google_service_account.kubernetes_service_account.email
  enable_vertical_pod_autoscaling = true
  horizontal_pod_autoscaling      = true
  node_pools = [
    {
      name               = "node-pool"
      machine_type       = "n1-standard-4"
      node_locations     = "us-central1-b,us-central1-c"
      min_count          = 1
      max_count          = 30
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 50
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      auto_upgrade       = false
      service_account    = google_service_account.kubernetes_service_account.email
      preemptible        = false
      initial_node_count = 2
    }
  ]
  # Additional Config
  config_connector                = true
  gce_pd_csi_driver               = true
}

resource "google_service_account" "kubernetes_service_account" {
  account_id = "k8s-service-account"
  project    = local.environment_config.google_project
}
