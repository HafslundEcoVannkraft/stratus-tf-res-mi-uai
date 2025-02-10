# stratus-tf-res-mi-uai
This module creates a Managed Identity with federated credentials against GitHub.

## Inputs 

### General

- `rg_name`: Name of the Resource Group for the Managed Identity.
- `location`: Location for the Managed Identity.

### UAI-Specific

- `uai_name`: Name for the Managed Identity.
- `federated_credentials`: Configuration for federated identity credentials for use with GitHub Actions.

  A map of objects with the following attributes:
  - `name`(required): Name of the federated identity.
  - `repository`(required): Name of the GitHub repository.
  - `organization` (required): GitHub organization for the federated identity.
  - `entity`: 'environment', 'pr', 'tag', or 'branch'(default: branch).
  - `value`: Value of the entity (default: main).
  - `audience`: Audience for the federated identity (default: [api://AzureADTokenExchange]).
  - `issuer`: Issuer for the federated identity (default: https://token.actions.githubusercontent.com).
## Outputs

- `uai_id`: The ID of the User Assigned Identity.

## Examples

### Example with Federated credential for main branch and pull requests

```hcl
module "user_assigned_identity" {
  source                = "github.com/HafslundEcoVannkraft/stratus-tf-res-mi-uai"
  rg_name               = "example-rg"
  location              = "norwayeast"
  uai_name              = "example-uai"
  federated_credentials = {
    "branch-main" = {
      name          = "example-repo-branch-main"
      repository    = "example-repo"
      organization  = "ExampleOrg"
      entity        = "branch"
      value         = "main"
    }
    "pr" = {
      name          = "example-repo-pr"
      repository    = "example-repo"
      organization  = "ExampleOrg"
      entity        = "pr"
    }
  }
}
```

### Example with Federated credential for a github environment
```hcl
module "user_assigned_identity" {
  source                = "github.com/HafslundEcoVannkraft/stratus-tf-res-mi-uai"
  rg_name               = "example-rg"
  location              = "norwayeast"
  uai_name              = "example-uai"
  federated_credentials = {
    "env-dev" = {
      name          = "example_repo_env_dev"
      repository    = "example_repo"
      organization  = "ExampleOrg"
      entity        = "environment"
      value         = "dev"
    }
  }
}
```