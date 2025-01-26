variable "chart_namespace" {
  description = "The namespace where the chart will be installed"
}

variable "chart_release_name" {
  description = "The name of the release"
}

variable "chart_repository_url" {
  description = "The URL of the chart repository"
}

variable "chart_name" {
  description = "The name of the chart"
}

variable "chart_version" {
  description = "The version of the chart"
}

variable "chart_values" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "The values to be passed to the chart"
  default     = []
}