output "terraform_workspace_id" {
  description = "Unique technical ID of the Terraform workspace"
  value       = random_uuid.terraform_workspace_id.result
}
