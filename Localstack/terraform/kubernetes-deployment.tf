resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "host-kubernetes-jenkins"
      }
    }
    template {
      metadata {
        labels = {
          name = "host-kubernetes-jenkins"
          App  = "host-kubernetes-jenkins"
        }
      }
      spec {
        container {
          image = "jenkins/jenkins:2.387.2"
          name  = "host-kubernetes-jenkins"
          port {
            container_port = 8080
            host_port      = 30080
          }
          port {
            container_port = 50000
            host_port      = 30050
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "host-kubernetes-jenkins-service" {
  metadata {
    name = "host-kubernetes-jenkins-service"
  }
  spec {
    selector = {
      name = "host-kubernetes-jenkins"
      app  = kubernetes_deployment.frontend.spec.0.template.0.metadata[0].labels.App
    }
    port {
      name        = "httpport"
      node_port   = 30080
      port        = 8080
      target_port = 8080
      protocol    = "TCP"
    }
    port {
      name        = "jnlpport"
      node_port   = 30050
      port        = 50000
      target_port = 50000
      protocol    = "TCP"
    }
    type = "NodePort"
  }
}
