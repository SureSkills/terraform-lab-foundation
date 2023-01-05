# Module: Cloud Build Trigger
module "build_trigger" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_build_trigger/dev"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

}
