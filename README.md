# stratus-tf-res-mi-uai
This module creates a Managed Identity with federated credentials against GitHub.

## Inputs 

### General

- `rg_name`: Name of the Resource Group for the Managed Identity.
- `location`: Location for the Managed Identity.

### UAI-Specific

- `uai_name`: Name for the Managed Identity.
- `uai_reponame`: Name of the GitHub Repository.
- `uai_identity_type`: Type of federated identity (environment, pr, merge).
- `uai_environment`: Environment for the federated identity if identity type is environment.
- `uai_ghorg` : Name of github organization

### Optional
- `uai_audience`: Default: "api://AzureADTokenExchange"
- `uai_issuer`: Default: "https://token.actions.githubusercontent.com"

## Outputs

- `uai_id`: The ID of the User Assigned Identity.

## Usage

To use this module, include it in your Terraform configuration as follows:

```hcl
module "user_assigned_identity" {
  source              = "path/to/your/module"
  rg_name             = "example-rg"
  location            = "East US"
  uai_name            = "example-uai"
  uai_reponame        = "example-repo"
  uai_identity_type   = "environment"
  uai_environment     = "dev"
  uai_ghorg           = "example-org"
}
```

## Examples

### Example with Pull Request Identity

```hcl
module "user_assigned_identity" {
  source              = "path/to/your/module"
  rg_name             = "example-rg"
  location            = "East US"
  uai_name            = "example-uai"
  uai_reponame        = "example-repo"
  uai_identity_type   = "pr"
  uai_ghorg           = "example-org"
}
```