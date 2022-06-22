variable "repositories" {
    type = list(object({name=string}))
    description = "List of repositories"
}

variable "secrets" {
    description = "Secrets to add"
}
