# eksctl Cheat Sheet

A collection of useful minikube commands for managing clusters, pods, deployments, and more.

## Table of Contents

- [minikube addons](#minikube-addons)
- [minikube config](#minikube-config)
- [minikube dashboard](#minikube-dashboard)
- [minikube delete](#minikube-delete)
- [minikube ip](#minikube-ip)
- [minikube service](#minikube-service)
- [minikube ssh](#minikube-ssh)
- [minikube start](#minikube-start)
- [minikube status](#minikube-status)
- [minikube stop](#minikube-stop)

---

## minikube addons

| Command | Description |
|-|-|
| `minikube addons list` | List the available addons for Minikube |
| `minikube addons disable [addon-name]` <br> `minikube addons disable metrics-server` | Disable a specific addon for Minikube |
| `minikube addons enable [addon-name]` <br> `minikube addons enable metrics-server` | Enable a specific addon for Minikube |

## minikube config

| Command | Description |
|-|-|
| `minikube config set driver docker` |  |

## minikube dashboard

| Command | Description |
|-|-|
| `minikube dashboard` | Open the Kubernetes dashboard in a web browser |

## minikube delete

| Command | Description |
|-|-|
| `minikube delete` | Delete the local Kubernetes cluster |

## minikube ip

| Command | Description |
|-|-|
| `minikube ip` | Get the IP address of the Minikube virtual machine |

## minikube service

| Command | Description |
|-|-|
| `minikube service <Deployment> --url` <br> `minukube service hello-minikube` <br> `minikube service helloworld-deployment --url` |  |

## minikube ssh

| Command | Description |
|-|-|
| `minikube ssh` | SSH into the Minikube virtual machine |

## minikube start

| Command | Description |
|-|-|
| `minikube start --driver=docker` <br> `minikube start --vm-driver=docker` <br> `minikube start --vm-driver=hyperkit --v=7 --alsologtostderr` <br> `minikube start -p cluster2` | Start a local Kubernetes cluster using Minikube |

## minikube status

| Command | Description |
|-|-|
| `minikube status` | Show the status of the local Kubernetes cluster |

## minikube stop

| Command | Description |
|-|-|
| `minikube stop` | Stop the local Kubernetes cluster |