terraform {
  backend "remote" {
    organization = "anshumantripathi"

    workspaces {
      name = "gcp-terraform-workspace"
    }
  }

  required_version = ">= 1.3.9"
}
