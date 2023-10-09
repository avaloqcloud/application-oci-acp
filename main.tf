
module "acf_resource_compute" {
    source = "github.com/avaloqcloud/acf_resource_compute"
    compartment_ocid        = var.compartment_ocid
    cloud_init_script       = "${file("${path.module}/scripts/config.sh")}"
    subnet_id               = var.private_subnet_id
    ssh_public_key          = var.ssh_authorized_key
    instance_shape          = var.instance_shape
    instance_image          = var.instance_image
    memory                  = var.instance_config.memory_in_gbs
    ocpus                   = var.instance_config.ocpus
    boot_volume_size_in_gbs = var.instance_config.boot_volume_size_in_gbs
    vm_name                 = "${var.display_name}-acp"
    availabilitydomain      = var.availability_domain
   
}

# resource "oci_core_instance" "acp_vm" {
#   availability_domain = 
#   compartment_id      = var.compartment_ocid
#   display_name        = "${var.display_name}-acp"
#   #freeform_tags       = {"sandbox-name"="${var.display_name}"}
#   shape               = var.instance_shape

#   shape_config {
#     memory_in_gbs = 48
#     ocpus = 6
#   }
 
#   create_vnic_details {
#     subnet_id        = var.private_subnet_id
#     display_name     = "${var.display_name}-acp"
#     assign_public_ip = false
#     hostname_label   = "${var.display_name}-acp"
#     #freeform_tags    = {"sandbox-name"="${var.sandbox_name}"}
#   }
 
#   source_details {
#     source_type = "image"
#     source_id = var.instance_image
#     boot_volume_size_in_gbs = "300"
#   } 
  
#   metadata = {
#     ssh_authorized_keys = var.ssh_authorized_key
#     user_data = "${base64encode(file("${path.module}/scripts/config.sh"))}"
#   }
#   timeouts {
#     create = "60m"
#   }
# }
