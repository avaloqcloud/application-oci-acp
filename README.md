## ACP Application deployment

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.eu-zurich-1.oraclecloud.com/p/4DcEi4tGw_rs-eCEhkvprCcv8Fjs-PBgldfmaPrNXXpQTMe7NbihQj8YB5QZXOgs/n/zrr2g2bttf8t/b/iso/o/acf_app_acp_new.zip)

The code provides a reusuable Terraform module that provisions a ACP instance on Oracle Cloud Infrastructure.  This modules required ACP image to create an instance. 
Click on above "Deploy to Oracle Cloud" button to deploy ACP instance using Oracle Resource Manager Stack.


## Usage
 
    module "acf_app_acp" {
        source = "https://github.com/avaloqcloud/acf_app_acp"
    }



## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.101.0 |
