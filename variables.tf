locals {

  billing_project = "014B18-76E511-9E2113"
  services = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "containerregistry.googleapis.com",
    "iap.googleapis.com",
    "binaryauthorization.googleapis.com",
  ]
  environment_config = {
    region         = "us-central1"
    google_project = "anshumantripathi-samyak"
  }

  gke_cluster = {
    name = "samyak-${local.environment_config.region}-cluster"
  }

  bastion = {
    name = "${local.gke_cluster.name}-bastion"
    zone = "${local.environment_config.region}-a"
    members = [
      "user:anshuman09tripathi@gmail.com"
    ]
  }
}
