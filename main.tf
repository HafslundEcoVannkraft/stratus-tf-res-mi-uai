# Managed Identity
resource "azurerm_user_assigned_identity" "uai" {
  name                = var.uai_name
  location            = var.location
  resource_group_name = var.rg_name

}


# Federated Identity Credential
resource "azurerm_federated_identity_credential" "uai_fed" {
  for_each            = var.federated_credentials
  name                = each.value.name
  resource_group_name = var.rg_name
  audience            = each.value.audience
  issuer              = each.value.issuer
  parent_id           = azurerm_user_assigned_identity.uai.id
  subject = (
    each.value.entity == "environment" ? "repo:${each.value.organization}/${each.value.repository}:environment:${each.value.value}" :
    each.value.entity == "pr" ? "repo:${each.value.organization}/${each.value.repository}:pull_request" :
    each.value.entity == "tag" ? "repo:${each.value.organization}/${each.value.repository}:ref:refs/tags/${each.value.value}" :
    "repo:${each.value.organization}/${each.value.repository}:ref:refs/heads/${each.value.value}"
  )
}