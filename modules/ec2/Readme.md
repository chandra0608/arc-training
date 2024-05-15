<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.ec2_instance_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [tls_private_key.httpdkey](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI to use for the EC2 instance. | `map(any)` | n/a | yes |
| <a name="input_associate_public_ip"></a> [associate\_public\_ip](#input\_associate\_public\_ip) | Whether the EC2 instance should have a public IP address. | `bool` | n/a | yes |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone for the EC2 instance. | `any` | n/a | yes |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | Whether the EC2 instance should be EBS-optimized. | `bool` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A list of egress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A list of ingress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name prefix for key pair | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name prefix for resources such as the security group, key pair, and EC2 instance. | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the root volume for the EC2 instance (in GB). | `number` | n/a | yes |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | The type of root volume for the EC2 instance (e.g., gp2, io1). | `any` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the ec2 security group | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | The ID of the subnet where the EC2 instance will be launched. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the resources. | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where the security group and EC2 instance will be created. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
<!-- END_TF_DOCS -->
