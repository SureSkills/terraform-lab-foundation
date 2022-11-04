# Module: Google Compute Engine
module "la_dataproc" {
  ## NOTE: Need to update the REMOTE path
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/dataproc_cluster/stable"
  github.com/SureSkills/terraform-lab-foundation//basics/dataproc_cluster/stable

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
}