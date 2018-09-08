locals {
  common_tags = "${map(
    "Projeto", "Projeto Integrador 3",
    "KubernetesCluster", "${BUILD_TAG}",
    "", "${var.cluster_id}"
  )}"
}
