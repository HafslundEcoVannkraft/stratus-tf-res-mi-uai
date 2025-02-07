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

variable "uai_ghorg" {
  type        = string
  description = "GitHub organization for the federated identity"
}

variable "federated_credentials" {
  type            = map(object({
    name          = string
    repository    = string
    organization  = string
    entity        = optional(string, "branch")
    value         = optional(string, "main")
    audience      = optional(list(string), ["api://AzureADTokenExchange"] )
    issuer        = optional(string, "https://token.actions.githubusercontent.com" )
  }))
  description = <<EOT
Configuration for federated identity credentials for use with GitHub Actions.

A map of objects with the following attributes:
- `name`(required): Name of the federated identity.
- `repository`(required): Name of the GitHub repository.
- `organization` (required): GitHub organization for the federated identity.
- `entity`: 'environment', 'pull_request', 'tag', or 'branch'(default: branch).
- `value`: Value of the entity (default: main).
- `audience`: Audience for the federated identity (default: [api://AzureADTokenExchange]).
- `issuer`: Issuer for the federated identity (default: https://token.actions.githubusercontent.com).
EOT
}