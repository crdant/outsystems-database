terraform {
  backend "gcs" {
    bucket = "terraform-state-os-database"
    prefix = "terraform/state/production"
  }
}
