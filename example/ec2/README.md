<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2\_instance](#module\_ec2\_instance) | ../../modules/ec2 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_subnet.arc_test_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpcs.arc_test_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | AMI for the instance | <pre>object({<br>    id            = string<br>    instance_type = string<br>  })</pre> | n/a | yes |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | The size of the root volume for the EC2 instance (in GB). | `bool` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability Zone for the instance | `string` | n/a | yes |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | Whether the instance is EBS-optimized | `bool` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules for the security group | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | name of the environment | `any` | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules for the security group | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name for the key\_pair | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the resources | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | name of the project | `any` | n/a | yes |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the root volume for the EC2 instance (in GB). | `number` | n/a | yes |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of root volume for the EC2 instance (e.g., gp2, io1). | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
<!-- END_TF_DOCS -->
