#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

locals {
  instance_host_name = var.hosted_zone != "" ? "${var.instance_name}.${data.aws_route53_zone.dns_zone[0].name}" : ""
}

data "aws_route53_zone" "dns_zone" {
  count = var.hosted_zone != "" ? 1 : 0
  name  = var.hosted_zone
  private_zone = true
}

resource "aws_route53_record" "dns_a_record" {
  count      = var.hosted_zone != "" ? 1 : 0
  depends_on = [aws_instance.instance]
  zone_id    = data.aws_route53_zone.dns_zone[0].zone_id
  name       = local.instance_host_name
  type       = "A"
  ttl        = "300"
  records    = [aws_instance.instance.private_ip]
}

resource "aws_route53_record" "dns_txt_record" {
  count   = var.hosted_zone != "" ? 1 : 0
  zone_id = data.aws_route53_zone.dns_zone[0].zone_id
  name    = local.instance_host_name
  type    = "TXT"
  ttl     = "300"
  records = ["{\\\"name\\\": \\\"${var.instance_name}\\\",\\\"user\\\": \\\"${var.owner}\\\"}"]
}
