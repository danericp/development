# eksctl Cheat Sheet

A collection of useful kind commands for managing clusters, pods, deployments, and more.

## Table of Contents

- [installation](#installation)
- [kind config](#kind-config)
- [kind create](#kind-create)
- [kind delete](#kind-delete)
- [kind get](#kind-get)

---

## Installation

| Command | Description |
|-|-|
| `brew install kind` | MAC Platform |

## kind config

| Command | Description |
|-|-|
| `curl https://raw.githubusercontent.com/hashicorp/learn-terraform-deploy-nginx-kubernetes-provider/main/kind-config.yaml --output kind-config.yaml` | Download Official Template |

## kind create

| Command | Description |
|-|-|
| `kind create cluster --name terraform-learn --config kind-config.yaml` | Using a sourced kind-config.yaml |

## kind delete

| Command | Description |
|-|-|
| `kind delete cluster --name terraform-learn` |  |

## kind get

| Command | Description |
|-|-|
| `kind get clusters` |  |
