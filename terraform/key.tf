resource "aws_key_pair" "deploy" {
  #public_key = "${file("${var.key_path}")}"
  #public_key = var.key_path
  key_name = "deploy-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiGrvUA8rpx/cPV1fyLbDmzzm4T8sXa4o0xAbmOf3km0u+bH2BQTFdeXUKqAZnK5jLLQ8ZD0mRrq96tQZGWFZW6b/fw7jDE/bFHlJk0jfy4XLUx+LNRKikmKeqEnyiJgF6n82n2HmGy4MaXIwTYitVUucaGcibxQnPATZ21M9sMwa3auHlSoZbeEq1eb05/PgoWaH/FvdUrqE7oQ0Ux6wiygMHBHi3/21qOgxLqZl/DbNZD7AOOlOr6sC2aWlucXAGRTg6DV3NVG54YtT5O3qEnItLMIS2NWEJfiIATmFt3q0jbtf7qmF0DgGccimD1wZWj1fXmoj4cjHjUA77y+XT ubuntu@ip-172-31-48-124"
}
