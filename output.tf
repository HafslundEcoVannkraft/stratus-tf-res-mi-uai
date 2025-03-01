output "id" {
  description = "The ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.uai.id
}

output "client_id" {
  description = "The ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.uai.client_id
}