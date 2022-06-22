terraform {
    required_providers {
        github = {
            source  = "integrations/github"
            version = "~> 4.0"
        }
    }
}

provider "github" {
    token = var.token
}

module "github-secrets" {
    source = "../"

    repositories = [ { name = "test" } ]
    secrets = {"all"={"test"="test"}, "test"={"test1"="test1"}}
}
