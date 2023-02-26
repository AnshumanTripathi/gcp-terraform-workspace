locals {
  google_project  = "anshumantripathi-samyak"
  billing_project = "014B18-76E511-9E2113"
  terraform_image = "hashicorp/terraform:1.3.9"
  services = [
    "iam.googleapis.com",
    "compute.googleapis.com",
  ]
}
