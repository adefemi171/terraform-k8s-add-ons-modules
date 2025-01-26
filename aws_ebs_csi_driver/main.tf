module "helm_release" {
  source = "../helm_release"

  chart_namespace = var.aws_ebs_csi_driver_namespace
  chart_release_name = var.aws_ebs_csi_driver_release_name
  chart_repository_url = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart_name = "aws-ebs-csi-driver"
  chart_version = var.aws_ebs_csi_driver_chart_version
  chart_values = var.ebs_csi_driver_values
  
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

