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
