#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

locals {
  tags = merge({
    "Name"       = var.instance_name
    "Creator"    = var.creator
    "Owner"      = var.owner
  }, var.tags)
}

provider "aws" {
  region       = var.region
  default_tags {
    tags = local.tags
  }
}

terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
