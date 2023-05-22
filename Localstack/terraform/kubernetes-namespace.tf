resource "kubernetes_namespace" "hello_world_namespace" {
  metadata {
    labels = {
      app = var.host-kubernetes-jenkins
    }
    name = "localstack-prod"
  }
}