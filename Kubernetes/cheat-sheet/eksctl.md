# eksctl Cheat Sheet

A collection of useful Kubernetes commands for managing clusters, pods, deployments, and more.

## Table of Contents

- [Basic Commands](#basic-commands)
- [Pods](#pods)
- [Deployments](#deployments)
- [Services](#services)
- [ConfigMaps](#configmaps)
- [Secrets](#secrets)

---

## Basic Commands

### General Information

| Command | Description |
|-|-|
| `kubectl cluster-info` | Get cluster information |
| `kubectl get all -n <namespace>` | Get all resources in a namespace |
| `kubectl get nodes` | Get nodes in the cluster |

## Pods

### Get cluster information

| Command | Description |
|-|-|
| `kubectl get pods` | List all pods in the cluster |
| `kubectl describe pod <pod_name>` | Get detailed information about a specific pod |
| `kubectl exec -it <pod_name> -- /bin/bash` | Exec into a pod |

| Command | Description |
|-|-|
| `kubectl cluster-info` | |
| `kubectl cluster-info dump` | |

