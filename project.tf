# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
# Enable all the apis listed in locals.services
resource "google_project_service" "samyak_services" {
  for_each = toset(local.services)
  project  = local.google_project
  service  = each.key
}

resource "google_project" "samyak" {
  name = "Samyak"
  project_id = local.google_project
  billing_account = local.billing_project
}
