<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/instance) | resource |
| [aws_security_group.ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/ami) | data source |
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/subnet) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.27.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | availability zone | `string` | `"eu-central-1a"` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | my network cidr | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | key name for key\_pair | `string` | `"work-mac"` | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | n/a | `string` | `"default-subnet-public1-eu-central-1a"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"default-vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_ip"></a> [ec2\_ip](#output\_ec2\_ip) | ec2 public IP address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
