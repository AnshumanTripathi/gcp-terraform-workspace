# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
# Enable all the apis listed in locals.services
resource "google_project_service" "samyak_services" {
  for_each = toset(local.services)
  project  = local.google_project
  service  = each.key
}

resource "google_project" "samyak" {
  name            = "Samyak"
  project_id      = local.google_project
  billing_account = local.billing_project
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "terraform_former" {
  account_id   = "terraform-former"
  project      = local.google_project
  display_name = "terraform-former"
  description = "Service account for terraform"
}


resource "google_service_account_iam_member" "terraform_former_iam_policy" {
  service_account_id = google_service_account.terraform_former.id
  member             = "serviceAccount:${google_service_account.terraform_former.name}"
  role               = "roles/owner"
}
