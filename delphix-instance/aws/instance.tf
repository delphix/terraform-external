#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

resource "aws_instance" "instance" {
  ami                    = var.image_id
  instance_type          = var.instance_size
  subnet_id              = var.subnet
  vpc_security_group_ids = var.security_groups
  iam_instance_profile   = var.instance_profile_name
}
