module "cluster_autoscaler" {
  source               = "../helm_release"
  chart_namespace      = var.cluster_autoscaler_namespace
  chart_release_name   = var.cluster_autoscaler_release_name
  chart_repository_url = "https://kubernetes.github.io/autoscaler"
  chart_name           = "cluster-autoscaler"
  chart_version        = var.cluster_autoscaler_chart_version
  chart_values         = var.cluster_autoscaler_values
}

resource "kubernetes_service_account" "cluster_autoscaler_service_account" {
  metadata {
    name      = var.cluster_autoscaler_service_account_name
    namespace = var.cluster_autoscaler_namespace
  }

  id                              = "${var.cluster_autoscaler_namespace}/${var.cluster_autoscaler_service_account_name}"
  automount_service_account_token = true
}

# if using AWS as your cloud provider, you create the role and policy

data "aws_iam_policy_document" "cluster_autoscaler_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }

}

resource "aws_iam_role" "cluster_autoscaler_role" {
  name               = "cluster-autoscaler-role"
  assume_role_policy = data.aws_iam_policy_document.cluster_autoscaler_assume_role_policy.json
}

resource "aws_iam_role_policy" "cluster_autoscaler_policy" {
  name   = "cluster-autoscaler-policy"
  role   = aws_iam_role.cluster_autoscaler_role.id
  policy = aws_iam_policy.cluster_autoscaler_policy.policy
}

resource "aws_iam_policy" "cluster_autoscaler_policy" {
  name        = "cluster-autoscaler"
  description = "Policy for cluster-autoscaler"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeScalingActivities",
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "eks:DescribeNodegroup"
      ],
      "Resource": "*"
    }
  ]
  
}
EOF
}
