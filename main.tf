# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A NAMESPACE WITH DEFAULT RBAC ROLES AND SERVICE ACCOUNTS BOUND TO THE ROLES
# These templates show an example of how to create a Kubernetes namespace with a set of default RBAC roles, and
# ServiceAccounts that are bound to each default role.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CONFIGURE OUR KUBERNETES CONNECTIONS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


provider "kubernetes" {
  # file config:
  config_context = var.kubectl_config_path == "" ? null : var.kubectl_config_context_name
  config_path    = var.kubectl_config_path == "" ? null : var.kubectl_config_path

  # credentials config:
  host                   = var.kubectl_config_path == "" ? var.cluster_endpoint : null
  token                  = var.kubectl_config_path == "" ? var.cluster_token : null
  cluster_ca_certificate = var.kubectl_config_path == "" ? base64decode(var.cluster_ca_certificate) : null

  # exec plugins:
  dynamic "exec" {
    for_each = var.kubectl_config_path == "" && var.cluster_token == "" ? var.exec_plugins : {}
    content {
      api_version = exec.value.api_version
      args        = exec.value.args
      command     = exec.value.command
    }
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE THE NAMESPACE WITH RBAC ROLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

module "namespace" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::https://github.com/gruntwork-io/terraform-kubernetes-namespace.git//modules/namespace?ref=v0.1.0"
  source = "./modules/namespace"

  create_resources = var.create_resources
  name             = var.name
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE THE SERVICE ACCOUNTS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

module "service_account_access_all" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::https://github.com/gruntwork-io/terraform-kubernetes-namespace.git//modules/service-account?ref=v0.1.0"
  source = "./modules/service-account"

  create_resources = var.create_resources
  name             = "${var.name}-admin"
  namespace        = module.namespace.name
  num_rbac_roles   = 1

  rbac_roles = [
    {
      name      = module.namespace.rbac_access_all_role
      namespace = module.namespace.name
    },
  ]

  # How to tag the service account with a label
  labels = {
    role = "admin"
  }
}

module "service_account_access_read_only" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git::https://github.com/gruntwork-io/terraform-kubernetes-namespace.git//modules/service-account?ref=v0.1.0"
  source = "./modules/service-account"

  create_resources = var.create_resources
  name             = "${var.name}-read-only"
  namespace        = module.namespace.name
  num_rbac_roles   = 1

  rbac_roles = [
    {
      name      = module.namespace.rbac_access_read_only_role
      namespace = module.namespace.name
    },
  ]

  # How to tag the service account with a label
  labels = {
    role = "monitor"
  }
}
