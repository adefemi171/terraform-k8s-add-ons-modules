variable "cluster_autoscaler_namespace" {}

variable "cluster_autoscaler_chart_version" {}

# Values should be cjanged according to the cloud provider
variable "cluster_autoscaler_values" {
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name  = "cloudProvider"
      value = "aws"
    },
    {
      name  = "awsRegion"
      value = "us-east-2"
    },
    {
      name  = "autoDiscovery.clusterName"
      value = "k8s-cluster"
    },
    {
      name  = "rbac.serviceAccount.create"
      value = "false"
    },
    {
      name  = "rbac.serviceAccount.name"
      value = "cluster-autoscaler"
    }
  ]
}

variable "cluster_autoscaler_service_account_name" {}
