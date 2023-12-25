# eksctl Cheat Sheet

A collection of useful eksctl commands for managing clusters, pods, deployments, and more.

## Table of Contents

- [eksctl create](#eksctl-create)
- [eksctl delete](#eksctl-delete)
- [eksctl get](#eksctl-get)
- [eksctl scale](#eksctl-scale)
- [eksctl update](#eksctl-update)

---

## eksctl create

### Create an EKS Cluster

```bash
eksctl create cluster --name getting-started-eks \
--region ap-southeast-2 \
--version 1.16 \
--managed \
--node-type t2.small \
--nodes 1 \
--ssh-access \
--ssh-public-key=~./ssh/id_rsa.pub \
--node-volume-size 200
```

```bash
eksctl create cluster \
--name my-cluster \
--version 1.21 \
--region us-west-2 \
--nodegroup-name my-node-group \
--node-type t3.medium \
--nodes 3 \
--managed
```

`eksctl create iamserviceaccount --name my-service-account --namespace default --cluster my-cluster --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --approve`

## eksctl delete

| Command | Description |
|-|-|
| `eksctl delete cluster --name my-cluster` | Delete an EKS cluster |

## eksctl get

| Command | Description |
|-|-|
| `eksctl get cluster --name my-cluster` <br> `eksctl get nodegroup --cluster my-cluster` | Get information about an EKS component |

## eksctl scale

| Command | Description |
|-|-|
| `eksctl scale nodegroup --cluster my-cluster --name my-node-group --nodes 5` | Scale an EKS node group |

## eksctl update

| Command | Description |
|-|-|
| `eksctl update cluster --name my-cluster` | Update an EKS cluster |

