# kubectl Cheat Sheet

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

### Configuration

| Command | Description |
|-|-|
| `kubectl config current-context` | |
| `kubectl config get-contexts` | |
| `kubectl config use-context <context>` | |
| `kubectl config view -o jsonpath='{.users[?(@.name == "e2e")].user.password}'` | |

### Creating a Component

| Command | Description |
|-|-|
| `kubectl create -f <yaml>` | |
| `kubectl create -f <yaml> --record` | |
| `kubectl create configmap example-config --from-file ./golang/configs/config.json` | |
| `kubectl create configmap nginx-content --from-file=/home/devopsinuse/udemy.jantoth.course/nginx/data` | |
| `kubectl create configmap nginx-content --from-file=index.html` | |
| `kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4` | |
| `kubectl create deployment my-nginx-deployment --image=nginx -n nginx` | |
| `kubectl create deployment pingpong --image alpine -- ping 1.1.1.1` | |
| `kubectl create ns example-app` | |
| `kubectl create secret generic mysecret --from-file .\golang\secrets\secret.json` | |

### Applying a Component

| Command | Description |
|-|-|
| `kubectl apply -f ./jenkins/amazon-eks/jenkins.pv.yaml -n jenkins` | |
| `kubectl apply -k "https://www.github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"` | |
| `kubectl apply -n example-app -f .\kubernetes\configmaps\configmap.yaml` | |
| `kubectl apply -n example-app -f .\kubernetes\deployments\deploy.yaml` | |
| `kubectl apply -n example-app -f .\kubernetes\secrets\secret.yaml` | |
| `kubectl apply -n example-app -f .\kubernetes\service\service.yaml` | |
| `kubectl apply -n jenkins -f ./jenkins/amazon-eks/jenkins.pvc.yaml` | |

### Describing a Component

| Command | Description |
|-|-|
| `kubectl describe deployment <Deployment>` | |
| `kubectl describe pod <pod>` | |
| `kubectl describe service <Service>` | |
| `kubectl describe service helloworld-deployment` | |
| `kubectl -n jenkins get pods` | |
| `kubectl -n jenkins get pvc` | |
| `kubectl get cm` | |
| `kubectl get configmaps` | |
| `kubectl get configmaps example-config -o yaml` | |
| `kubectl get deployments` | |
| `kubectl get ingress` | |
| `kubectl get namespaces` | |
| `kubectl get node` | |
| `kubectl get nodes` | |
| `kubectl get nodes -o jsonpath="{range .items[*]}Kubernetes, Node: {.metadata.name}, InternalIP: {.status.addresses[0].address} {end}"` | |
| `kubectl get ns` | |
| `kubectl get po` | |
| `kubectl get pods --namespace=jira` | |
| `kubectl get pods --show-labels` | |
| `kubectl get pods -o jsonpath="{.items[*].metadata.name}"` | |
| `kubectl get pods -o jsonpath="{range .items[*]}[{.metadata.name}, {.spec.containers[*].image}]{end}"` | |
| `kubectl get pods -w` | |
| `kubectl get pv` | |
| `kubectl get rs` | |
| `kubectl get secrets` | |
| `kubectl get service` | |
| `kubectl get services` | |
| `kubectl get service hello-kubernetes` | |

### Fetching Logs

| Command | Description |
|-|-|
| `kubectl logs <Pod-Name>` | |
| `kubectl logs deployment/my-apache --follow --tail 1` | |
| `kubectl logs -l run=my-apache` | |
| `kubectl -n jenkins exec -it <podname> cat /var/jenkins_home/secrets/initialAdminPassword` | |

### Exposing Ports

| Command | Description |
|-|-|
| `kubectl expose deployment <Deployment> --type=NodePort` | |
| `kubectl expose deployment helloworld-deployment --type=NodePort` | |
| `kubectl expose deployment my-nginx-deployment --name=my-nginx-service --port=80 --type=NodePort` | |
| `kubectl expose deployment hello-minikube --type=NodePort --port=8080` | |
| `kubectl expose deployment hello-kubernetes --type=NodePort` | |

### Deleting Resources

| Command | Description |
|-|-|
| `kubectl delete < >` | |

### Rollout

| Command | Description |
|-|-|
| `kubectl rollout history deployment/helloworld-deployment` | |
| `kubectl rollout status <Deployment>` | |
| `kubectl rollout status deployment/helloworld-deployment` | |

### Run

| Command | Description |
|-|-|
| `kubectl run hello-kubernetes --image=k8s.gcr.io/echoserver:1.4 --port=8080` | |
| `kubectl run pingpong --image alpine --command -- ping 1.1.1.1` | |

### Scaling

| Command | Description |
|-|-|
| `kubectl scale --replicas=4 -f <yaml>` | |
| `kubectl scale --replicas=4 <ReplicationController>` | |

### Tagging

| Command | Description |
|-|-|
| `kubectl set image <Deployment> k8s-demo=wardviaene/k8s-demo:2` | |

### Port Forwarding

| Command | Description |
|-|-|
| `kubectl port-forward -n example-app example-deploy-f323e23d265g-32e2 5000` | |
| `kubectl port-forward -n jenkins <podname> 8080` | |
| `kubectl port-forward svc/my-flask-service 5000:5000` | |