variable "aws_adot_exporter_namespace" {}

variable "aws_adot_exporter_release_name" {}

variable "aws_adot_exporter_chart_version" {}

variable "aws_adot_exporter_values" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "metada_name" {}

variable "secret_type" {}

variable "secrets_data" {
  type = map(string)
}
