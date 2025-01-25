variable "aws_ebs_csi_driver_namespace" {}

variable "aws_ebs_csi_driver_release_name" {}

variable "aws_ebs_csi_driver_chart_version" {}

variable "ebs_csi_driver_values" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "aws_ebs_csi_driver_storage_provisioner" {}

variable "aws_ebs_csi_driver_reclaim_policy" {}

variable "aws_ebs_csi_driver_volume_binding_mode" {}

variable "aws_ebs_csi_driver_parameters_type" {}

variable "aws_ebs_csi_driver_parameters_encrypted" {}

variable "aws_ebs_csi_driver_parameters_kmsKeyId" {}