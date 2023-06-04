locals {

  billing_project = "014B18-76E511-9E2113"
  services = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
  ]
  environment_config = {
    region         = "us-central1"
    google_project = "anshumantripathi-samyak"
  }

  gke_cluster = {
    name = "samyak-${local.environment_config.region}-cluster"
  }
}
