variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the Managed Identity."
}

variable "uai_name" {
  type        = string
  description = "Name of the managed identity"
}

variable "uai_reponame" {
  type        = string
  description = "Name of the repository for the federated identity"
}

variable "uai_identity_type" {
  description = "The type of federated identity (environment, pr, merge)"
  type        = string
  default     = "environment"
}

variable "uai_environment" {
  type        = string
  description = "Environment for the federated identity if identity type is environment"
}

variable "uai_audience" {
  type        = string
  description = "Audience for the federated identity"
  default     = "api://AzureADTokenExchange"
}

variable "uai_issuer" {
  type        = string
  description = "Issuer for the federated identity"
  default     = "https://token.actions.githubusercontent.com"
}

variable "uai_ghorg" {
  type        = string
  description = "GitHub organization for the federated identity"
}