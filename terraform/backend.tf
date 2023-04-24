terraform {
  backend "gcs" {
    prefix = "infrastructure"
  }
}
