resource "helm_release" "aws_ebs_csi_driver" {
  namespace        = var.aws_ebs_csi_driver_namespace
  create_namespace = true

  name       = var.aws_ebs_csi_driver_release_name
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  version    = var.aws_ebs_csi_driver_chart_version

  dynamic "set" {
    for_each = var.ebs_csi_driver_values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }

  }
}

resource "kubernetes_storage_class" "aws_ebs_csi_driver_storage_class" {
  metadata {
    name = "aws-ebs"
  }

  storage_provisioner = var.aws_ebs_csi_driver_storage_provisioner
  reclaim_policy      = var.aws_ebs_csi_driver_reclaim_policy
  volume_binding_mode = var.aws_ebs_csi_driver_volume_binding_mode

  parameters = {
    type      = var.aws_ebs_csi_driver_parameters_type
    encrypted = var.aws_ebs_csi_driver_parameters_encrypted
    kmsKeyId  = var.aws_ebs_csi_driver_parameters_kmsKeyId
  }

}

