<!--
:type: service
:name: Kubernetes Namespace
:description: Deploy a Kubernetes Namespace on to any Kubernetes cluster.
:icon: /_docs/ns-128.png
:category: docker-orchestration
:cloud: aws
:tags: docker, orchestration, kubernetes, containers
:license: gruntwork
:built-with: terraform
-->

# Kubernetes Namespace

[![Maintained by Gruntwork.io](https://img.shields.io/badge/maintained%20by-gruntwork.io-%235849a6.svg)](https://gruntwork.io/?ref=repo_k8s_namespace)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.1.0-blue.svg)

This repo contains a Module for managing [Kubernetes
Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) with
[Terraform](https://www.terraform.io).




## Features

* Deploy a Namespace from scratch
* Configure Namespaces with default RBAC roles
* Create and manage Namespace scoped Service Accounts with various access levels via RBAC




## Learn

This repo is a part of [the Gruntwork Infrastructure as Code Library](https://gruntwork.io/infrastructure-as-code-library/),
a collection of reusable, battle-tested, production ready infrastructure code. If you've never used the Infrastructure as Code Library
before, make sure to read [How to use the Gruntwork Infrastructure as Code Library](https://gruntwork.io/guides/foundations/how-to-use-gruntwork-infrastructure-as-code-library/)!

### Core concepts

* [What is a Namespace?](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/modules/namespace/README.md#what-is-a-namespace)
* [What is Kubernetes RBAC?](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/modules/namespace-roles/README.md#what-is-kubernetes-role-based-access-control-rbac)
* [What is a Service Account?](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/modules/service-account/README.md#what-is-a-serviceaccount)
* [Official Kubernetes Docs on Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
* [Official Kubernetes Docs on Service Accounts](https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/)
* [Official Kubernetes Docs on RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

### Repo organization

* [modules](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/modules): the main implementation code for this repo, broken down into multiple standalone, orthogonal submodules.
* [examples](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/examples): This folder contains working examples of how to use the submodules.
* [test](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/test): Automated tests for the modules and examples.




## Deploy

* [examples folder](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/examples): The `examples` folder contains sample code optimized for learning, experimenting, and testing (but not production usage).



## Manage

* [How do you bind RBAC roles](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/modules/namespace-roles/README.md#how-do-you-bind-the-roles)



## Support

If you need help with this repo or anything else related to infrastructure or DevOps, Gruntwork offers [Commercial Support](https://gruntwork.io/support/) via Slack, email, and phone/video. If you're already a Gruntwork customer, hop on Slack and ask away! If not, [subscribe now](https://www.gruntwork.io/pricing/). If you're not sure, feel free to email us at [support@gruntwork.io](mailto:support@gruntwork.io).




## Contributions

Contributions to this repo are very welcome and appreciated! If you find a bug or want to add a new feature or even contribute an entirely new module, we are very happy to accept pull requests, provide feedback, and run your changes through our automated test suite.

Please see [Contributing to the Gruntwork Infrastructure as Code Library](https://gruntwork.io/guides/foundations/how-to-use-gruntwork-infrastructure-as-code-library/#contributing-to-the-gruntwork-infrastructure-as-code-library) for instructions.




## License

Please see [LICENSE.txt](https://github.com/gruntwork-io/terraform-kubernetes-namespace/blob/main/LICENSE.txt) for details on how the code in this repo is licensed.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.41.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_namespace"></a> [namespace](#module\_namespace) | ./modules/namespace | n/a |
| <a name="module_service_account_access_all"></a> [service\_account\_access\_all](#module\_service\_account\_access\_all) | ./modules/service-account | n/a |
| <a name="module_service_account_access_read_only"></a> [service\_account\_access\_read\_only](#module\_service\_account\_access\_read\_only) | ./modules/service-account | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | The root certificates bundle for TLS authentication | `string` | `""` | no |
| <a name="input_cluster_endpoint"></a> [cluster\_endpoint](#input\_cluster\_endpoint) | The hostname (in form of URI) of the Kubernetes API | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | `""` | no |
| <a name="input_create_resources"></a> [create\_resources](#input\_create\_resources) | Set to false to have this module skip creating resources. | `bool` | `true` | no |
| <a name="input_exec_plugins"></a> [exec\_plugins](#input\_exec\_plugins) | The Configuration block to use an exec-based credential plugin | `map(any)` | `{}` | no |
| <a name="input_kubectl_config_context_name"></a> [kubectl\_config\_context\_name](#input\_kubectl\_config\_context\_name) | The config context to use when authenticating to the Kubernetes cluster. If empty, defaults to the current context specified in the kubeconfig file. | `string` | `""` | no |
| <a name="input_kubectl_config_path"></a> [kubectl\_config\_path](#input\_kubectl\_config\_path) | The path to the config file to use for kubectl. If empty, defaults to $HOME/.kube/config | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the namespace to be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of the created namespace |
| <a name="output_rbac_access_all_role"></a> [rbac\_access\_all\_role](#output\_rbac\_access\_all\_role) | The name of the RBAC role that grants admin level permissions on the namespace. |
| <a name="output_rbac_access_read_only_role"></a> [rbac\_access\_read\_only\_role](#output\_rbac\_access\_read\_only\_role) | The name of the RBAC role that grants read only permissions on the namespace. |
| <a name="output_service_account_access_all"></a> [service\_account\_access\_all](#output\_service\_account\_access\_all) | The name of the ServiceAccount that has admin level permissions. |
| <a name="output_service_account_access_read_only"></a> [service\_account\_access\_read\_only](#output\_service\_account\_access\_read\_only) | The name of the ServiceAccount that has read only level permissions. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
