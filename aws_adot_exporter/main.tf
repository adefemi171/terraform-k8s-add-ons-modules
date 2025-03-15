module "aws_adot_exporter" {
  source               = "../helm_release"
  chart_namespace      = var.aws_adot_exporter_namespace
  chart_release_name   = var.aws_adot_exporter_release_name
  chart_repository_url = "https://aws.github.io/aws-otel-collector-helm"
  chart_name           = "aws-otel-collector"
  chart_version        = var.aws_adot_exporter_chart_version
  chart_values         = var.aws_adot_exporter_values
}


resource "kubernetes_secret" "example" {
  metadata {
    name = var.metada_name
    labels = {
      enabled = !"{{.cluster.name.pattern}}"
    }
  }

  type = var.secret_type
  data = var.secrets_data
}