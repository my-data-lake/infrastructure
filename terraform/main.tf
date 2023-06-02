provider "google" {}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account
}

resource "google_storage_bucket" "tfstate_bucket" {
  name                     = "${google_project.project.project_id}-terraform-state"
  project                  = google_project.project.project_id
  location                 = var.region
  public_access_prevention = "enforced"
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "raw_zone_bucket" {
  name                     = "${google_project.project.project_id}-raw-zone"
  project                  = google_project.project.project_id
  location                 = var.region
  public_access_prevention = "enforced"
  autoclass {
    enabled = true
  }
}
