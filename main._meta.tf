resource "random_uuid" "terraform_workspace_id" {
  keepers = {
    "terraform-workspace" = terraform.workspace
  }
}
