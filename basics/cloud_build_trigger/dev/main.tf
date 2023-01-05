resource "google_cloudbuild_trigger" "build-trigger" {
  location = "global"

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

    source {
      storage_source {
        bucket = "mybucket"
        object = "source_code.tar.gz"
      }
    }
    tags = ["build", "newFeature"]
    substitutions = {
      _FOO = "bar"
      _BAZ = "qux"
    }
  }
}