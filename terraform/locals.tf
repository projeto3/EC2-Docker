locals {
  common_tags = "${map(
    "Project", "openshift",
    "KubernetesCluster", "${var.cluster_id}",
    "kubernetes.io/cluster/${var.cluster_name}", "${var.cluster_id}"
  )}"
}
