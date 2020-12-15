output "name" {
  description = "The name of the created namespace."
  value       = element(concat(kubernetes_namespace.namespace.*.id, [""]), 0)
}

output "rbac_access_all_role" {
  description = "The name of the RBAC role that grants admin level permissions on the namespace."
  value       = module.namespace_roles.rbac_access_all_role
}

output "rbac_access_read_only_role" {
  description = "The name of the RBAC role that grants read only permissions on the namespace."
  value       = module.namespace_roles.rbac_access_read_only_role
}

output "rbac_helm_metadata_access_role" {
  description = "The name of the RBAC role that grants minimal permissions for Helm to manage its metadata."
  value       = module.namespace_roles.rbac_helm_metadata_access_role
}

output "rbac_helm_resource_access_role" {
  description = "The name of the RBAC role that grants minimal permissions for Helm to manage resources in this namespace."
  value       = module.namespace_roles.rbac_helm_resource_access_role
}
