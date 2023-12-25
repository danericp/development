# eksctl Cheat Sheet

A collection of useful helm commands for managing clusters, pods, deployments, and more.

## Table of Contents

- [Add](#add)
- [Remove](#remove)
- [Update](#update)
- [Upgrade](#upgrade)

---

## Add

| Command | Description |
|-|-|
| `helm repo add localstack https://helm.localstack.cloud` |  |

## Remove

| Command | Description |
|-|-|
| `helm repo remove localstack` |  |

## Update

| Command | Description |
|-|-|
| `helm repo update` |  |

## Upgrade

| Command | Description |
|-|-|
| `helm upgrade --install localstack localstack/localstack --namespace localstack --create-namespace --values values.yaml` |  |