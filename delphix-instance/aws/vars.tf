#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

variable "data_disks" {
  description = "Map of data disks to create and attach to instance"
  type = map(
    object({
      device_name = string
      size        = number
      type        = string
      iops        = number
      throughput  = number
  }))
  default = {
    "/dev/sde" : {
      "device_name" : "/dev/sde"
      "size" : 8
      "type" : "gp3"
      "iops" : null
      "throughput" : null
    },
    "/dev/sdf" : {
      "device_name" : "/dev/sdf"
      "size" : 8
      "type" : "gp3"
      "iops" : null
      "throughput" : null
    },
    "/dev/sdg" : {
      "device_name" : "/dev/sdg"
      "size" : 8
      "type" : "gp3"
      "iops" : null
      "throughput" : null
    }
  }
}

variable "instance_name" {
  description = "Name of new instance"
  type        = string
}

variable "image_id" {
  description = "AMI image ID used for main instance"
  type        = string
}

variable "instance_size" {
  description = "AWS instance size"
  type        = string
  default     = "t3.large"
}

variable "instance_profile_name" {
  description = "Name of an IAM instance profile to attach to the instance"
  type = string
  default = null
}

variable "creator" {
  description = "Instance creator, used for tagging"
  type        = string
}

variable "owner" {
  description = "Instance owner, used for tagging"
  type        = string
}

variable "hosted_zone" {
  description = "Hosted zone name to create a Route53 record in"
  type        = string
  default     = ""
}

variable "subnet" {
  description = "ID of the subnet for the instance"
  type        = string
}

variable "security_groups" {
  description = "List of IDs of security groups for the instance"
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to tag all resources with"
  type        = map(string)
  default = {}
}
