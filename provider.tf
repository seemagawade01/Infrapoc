provider "google" {
  project = local.project_id
  region  = "us-central1"
  zone    = "us-central1-b"
}
