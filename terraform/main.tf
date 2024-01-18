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

resource "google_project_service" "cloudfunctions_api" {
  project = google_project.project.project_id
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "run_api" {
  project = google_project.project.project_id
  service = "run.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  project = google_project.project.project_id
  service = "cloudbuild.googleapis.com"
}

resource "google_project_service" "artifactregistry" {
  project = google_project.project.project_id
  service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "workflows_api" {
  project = google_project.project.project_id
  service = "workflows.googleapis.com"
}

resource "google_project_service" "cloudscheduler_api" {
  project = google_project.project.project_id
  service = "cloudscheduler.googleapis.com"
}

resource "google_project_service" "eventarc_api" {
  project = google_project.project.project_id
  service = "eventarc.googleapis.com"
}

resource "google_project_service" "bigquery_api" {
  project = google_project.project.project_id
  service = "bigquery.googleapis.com"
}

resource "google_project_service" "firestore_api" {
  project = google_project.project.project_id
  service = "firestore.googleapis.com"
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.project.project_id
}

resource "google_firestore_database" "database" {
  project                 = google_firebase_project.default.project
  name                    = "(default)"
  location_id             = "nam5"
  type                    = "FIRESTORE_NATIVE"
}
