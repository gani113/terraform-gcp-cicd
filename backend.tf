terraform {
  backend "gcs" {
    bucket = "terraform-gcp-state-1"
    prefix = "my-state-bucket"
    # credentials = "keys.json"
  }
}
