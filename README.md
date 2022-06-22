# terraform-github-action-secrets

Easily manage secrets across multiple repositories with shared and unique secrets.

## How to use

All secrets stored under the "all" object will be applied to all repositories.
To add secrets that only go to one repository add an object (In the example, see "test") that contains the unique secrets

```hcl
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Remember the repository owner always defaults to the key owner
# define the owner attribute if you need another
provider "github" {
  token = var.token
}

module "github-secrets" {
  source  = "math280h/action-secrets/github"
  version = "0.0.1"
  
  # In this example this would point to one repository with the full name
  # math280h/test
  # And two secrets would be created, "test" from the "all" object and
  # since the name matches, "test1" from the "test" object.
  repositories = [{ name = "test" }] 
  secrets      = { "all" = { "test" = "test" }, "test" = { "test1" = "test1" } }
}
```
