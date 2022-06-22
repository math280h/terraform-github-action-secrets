data "github_actions_public_key" "repo_public_key" {

    for_each = { for project_module in var.repositories : project_module[ "name" ] => project_module }

    repository = each.value.name

}

resource "github_actions_secret" "custom_repo_secrets" {

    for_each = { for object in local.module_secrets_list : "${ object[ "repo" ] }-${ object[ "name" ] }" => object }

    repository      = each.value.repo
    secret_name     = each.value.name
    plaintext_value = each.value.value

}
