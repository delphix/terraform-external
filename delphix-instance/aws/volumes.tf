#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

resource "aws_ebs_volume" "data_disk" {
  for_each = var.data_disks

  availability_zone = aws_instance.instance.availability_zone
  size              = each.value.size
  type              = each.value.type
  iops              = each.value.iops
  throughput        = each.value.throughput
}

resource "aws_volume_attachment" "data_disk_attachment" {
  for_each = var.data_disks

  device_name = each.value.device_name
  instance_id = aws_instance.instance.id
  volume_id   = aws_ebs_volume.data_disk[each.key].id
}
