# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "Name of the namespace to be created"
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = ""
}

variable "kubectl_config_context_name" {
  description = "The config context to use when authenticating to the Kubernetes cluster. If empty, defaults to the current context specified in the kubeconfig file."
  type        = string
  default     = ""
}

variable "kubectl_config_path" {
  description = "The path to the config file to use for kubectl. If empty, defaults to $HOME/.kube/config"
  type        = string
  default     = ""
}

variable "cluster_endpoint" {
  description = "The hostname (in form of URI) of the Kubernetes API"
  type        = string
  default     = ""
}

variable "cluster_ca_certificate" {
  description = "The root certificates bundle for TLS authentication"
  type        = string
  default     = ""
}

variable "exec_plugins" {
  description = "The Configuration block to use an exec-based credential plugin"
  type        = map(any)
  default     = {}
}


# ---------------------------------------------------------------------------------------------------------------------
# TEST PARAMETERS
# These variables are only used for testing purposes and should not be touched in normal operations.
# ---------------------------------------------------------------------------------------------------------------------

variable "create_resources" {
  description = "Set to false to have this module skip creating resources."
  type        = bool
  default     = true
}
