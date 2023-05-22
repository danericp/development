terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
  required_version = ">= 0.13.4"
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = var.region
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

provider "docker" {
  host = "unix:///Users/eric/.docker/run/docker.sock"
}

provider "helm" {
  kubernetes {
    config_path = "/Users/eric/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "/Users/eric/.kube/config"
  host        = "https://127.0.0.1:6443"
}

# provider "kubernetes" {
#   host           = "https://127.0.0.1:51086" # kubectl config view > -cluster.server
#   config_path    = "~/.kube/config"
#   config_context = "my-context"
# }
# provider "kubernetes" {
#   host           = "https://127.0.0.1:51086" # kubectl config view > -cluster.server
#   config_path    = "~/.kube/config"
#   config_context = "my-context"
# }