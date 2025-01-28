# Managed Identity
resource "azurerm_user_assigned_identity" "uai" {
  name                = var.uai_name
  location            = var.location
  resource_group_name = var.rg_name

}

# Federated Identity Credential
resource "azurerm_federated_identity_credential" "uai_fed" {
  name                = "${var.uai_name}-fed"
  resource_group_name = var.rg_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  parent_id           = azurerm_user_assigned_identity.uai.id
  subject = (
    var.uai_identity_type == "merge" ? "repo:${var.uai_ghorg}/${var.uai_reponame}:merge" :
    var.uai_identity_type == "pr" ? "repo:${var.uai_ghorg}/${var.uai_reponame}:pr" :
    "repo:${var.uai_ghorg}/${var.uai_reponame}:environment:${var.uai_environment}"
  )
}