locals {
  google_project  = "anshumantripathi-samyak"
  billing_project = "014B18-76E511-9E2113"
  services = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
  ]
  gke_cluster_config = {
    region = "us-central1"
  }
}
