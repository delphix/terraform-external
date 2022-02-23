#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

output "instance_id" {
  value = aws_instance.instance.id
}

output "instance_ip" {
  value = aws_instance.instance.private_ip
}
