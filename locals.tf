locals {
    module_secrets = flatten([
        for module_key, gh_module in var.repositories : {
            name    = gh_module[ "name" ],
            secrets = merge(
                var.secrets[ "all" ],
                lookup(var.secrets, gh_module[ "name" ], {})
            )
        }
    ])

    module_secrets_list = flatten([
        for module_secret_key, module_secret_object in local.module_secrets : [
            for secret_key, secret_value in module_secret_object[ "secrets" ] : {
                repo  = module_secret_object[ "name" ]
                name  = secret_key
                value = secret_value
            }
        ]
    ])
}
