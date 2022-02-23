Copyright (c) 2022 by Delphix. All rights reserved.

# About

This repository contains a Terraform module to create a generic Delphix
instance in AWS.

This module can be invoked as follows

```
module "delphix_instance" {
    source          = "./delphix-instance"

    region          = "us-west-2"
    hosted_zone     = "testing-hosted-zone"      # Replace with a hosted zone name
    instance_name   = "testing-instance"         # Replace with a name for the instance
    image_id        = "test-ami-id"              # Replace with a Delphix AMI ID
    instance_size   = "t3.large"
    creator         = "test-creator"             # Replace with the creator, used for tagging
    owner           = "test-owner"               # Replace with the owner, used for tagging
    subnet          = "test-subnet-id"           # Replace with the subnet ID for the instance
    security_groups = ["test-security-group-id"] # Replace with the security group ID for the instance
    tags = {
        test = "test"                            # Replace this with tags to apply to all applicable resources
    }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.data_disk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route53_record.dns_a_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.dns_txt_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_volume_attachment.data_disk_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_route53_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_creator"></a> [creator](#input\_creator) | Instance creator, used for tagging | `string` | n/a | yes |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Map of data disks to create and attach to instance | <pre>map(<br>    object({<br>      device_name = string<br>      size        = number<br>      type        = string<br>      iops        = number<br>      throughput  = number<br>  }))</pre> | <pre>{<br>  "/dev/sde": {<br>    "device_name": "/dev/sde",<br>    "iops": null,<br>    "size": 8,<br>    "throughput": null,<br>    "type": "gp3"<br>  },<br>  "/dev/sdf": {<br>    "device_name": "/dev/sdf",<br>    "iops": null,<br>    "size": 8,<br>    "throughput": null,<br>    "type": "gp3"<br>  },<br>  "/dev/sdg": {<br>    "device_name": "/dev/sdg",<br>    "iops": null,<br>    "size": 8,<br>    "throughput": null,<br>    "type": "gp3"<br>  }<br>}</pre> | no |
| <a name="input_hosted_zone"></a> [hosted\_zone](#input\_hosted\_zone) | Hosted zone name to create a Route53 record in | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | AMI image ID used for main instance | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of new instance | `string` | n/a | yes |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | Name of an IAM instance profile to attach to the instance | `string` | `null` | no |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | AWS instance size | `string` | `"t3.large"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Instance owner, used for tagging | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-west-2"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of IDs of security groups for the instance | `list(string)` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | ID of the subnet for the instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to tag all resources with | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_instance_ip"></a> [instance\_ip](#output\_instance\_ip) | n/a |
<!-- END_TF_DOCS -->