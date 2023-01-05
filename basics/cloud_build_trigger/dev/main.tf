resource "google_cloudbuild_trigger" "filename-trigger" {
  location = "us-central1"

  trigger_template {
    branch_name = "main"
    repo_name   = "my-repo"
  }
  
  build {
    step {
      name = "gcr.io/cloud-builders/gsutil"
      args = ["cp", "gs://mybucket/remotefile.zip", "localfile.zip"]
      timeout = "120s"
      secret_env = ["MY_SECRET"]
    }

    step {
      name   = "ubuntu"
      script = "echo hello" # using script field
    }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "cloudbuild.yaml"
}}