resource "helm_release" "chart_release" {
  namespace        = var.chart_namespace
  create_namespace = true

  name       = var.chart_release_name
  repository = var.chart_repository_url
  chart      = var.chart_name
  version    = var.chart_version

  dynamic "set" {
    for_each = var.chart_values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }

  }
}