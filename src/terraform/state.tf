terraform {
  backend "gcs" {
    bucket = "terraform-outsystems-database"
    prefix = "terraform/state/production"
  }
}
