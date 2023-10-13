## ACP Application deployment

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.eu-zurich-1.oraclecloud.com/p/4DcEi4tGw_rs-eCEhkvprCcv8Fjs-PBgldfmaPrNXXpQTMe7NbihQj8YB5QZXOgs/n/zrr2g2bttf8t/b/iso/o/acf_app_acp_new.zip)

The code provides a reusuable Terraform module that provisions a ACP instance on Oracle Cloud Infrastructure.  This modules required ACP image to create an instance. 


## Usage
 
    module "acf_app_acp" {
        source = "https://github.com/avaloqcloud/acf_app_acp"
    }



## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.101.0 |



## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acp"></a> [acp](#module\_acp) | ./acf_resource_compute | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | Availability Domain | `string` | n/a | yes |
| <a name="input_compartment_ocid"></a> [compartment\_ocid](#input\_compartment\_ocid) | Compartment OCID | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Name of the ACP instance | `string` | n/a | yes |
| <a name="input_instance_config"></a> [instance\_config](#input\_instance\_config) | n/a | <pre>object({<br>    ocpus = string<br>    memory_in_gbs = string<br>    boot_volume_size_in_gbs = string<br>  })</pre> | <pre>{<br>  "boot_volume_size_in_gbs": "500",<br>  "memory_in_gbs": "48",<br>  "ocpus": "6"<br>}</pre> | no |
| <a name="input_instance_image"></a> [instance\_image](#input\_instance\_image) | n/a | `string` | n/a | yes |
| <a name="input_instance_shape"></a> [instance\_shape](#input\_instance\_shape) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | OCID of private subnet in which to create a instance | `string` | n/a | yes |
| <a name="input_ssh_authorized_key"></a> [ssh\_authorized\_key](#input\_ssh\_authorized\_key) | RSA public key in PEM format. It will added as authorized key for remote connection over SSH | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | ACP Instance Private IP |

