# Terraform Module for Installing and Configuring a Add-ons for Kubernetes Cluster

This module installs and configures add-ons for a Kubernetes cluster. The add-ons include:

- Adot Exporter
- [AWS EBS CSI Driver](https://github.com/kubernetes-sigs/aws-ebs-csi-driver/tree/master/charts/aws-ebs-csi-driver)
- [AWS Load Balancer Controller](https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controller)
- [AWS VPC CNI](https://github.com/aws/eks-charts/tree/master/stable/aws-vpc-cni)
- [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/charts/cluster-autoscaler)
- [Gatekeeper](https://github.com/open-policy-agent/gatekeeper/tree/master/charts/gatekeeper)
- [Metrics Server](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server) - WIP


## Usage

```hcl
module "cluster_autoscaler" {
    source = "github.com/adefemi171/terraform-k8s-add-ons-modules/cluster-autoscaler"
    cluster_autoscaler_namespace = ""
    cluster_autoscaler_release_name = ""
    cluster_autoscaler_chart_version = ""
    cluster_autoscaler_service_account_name = ""
}

module "aws_ebs_csi_driver" {
    source = "github.com/adefemi171/terraform-k8s-add-ons-modules/aws-ebs-csi-driver"
    aws_ebs_csi_driver_namespace = ""
    aws_ebs_csi_driver_release_name = ""
    aws_ebs_csi_driver_chart_version = ""
    ebs_csi_driver_values = ""
    aws_ebs_csi_driver_storage_provisioner = ""
    aws_ebs_csi_driver_reclaim_policy = ""
    aws_ebs_csi_driver_volume_binding_mode = ""
    aws_ebs_csi_driver_parameters_type = ""
    aws_ebs_csi_driver_parameters_encrypted = ""
    aws_ebs_csi_driver_parameters_kmsKeyId = ""
}
```


> **Note:** This module is a WIP and is partially functional. It is not recommended for production use.
