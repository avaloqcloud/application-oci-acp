module "acp" {
    source = "./terraform-oci-compute"
    #source = "https://github.com/avaloqcloud/terraform-oci-compute"
    compartment_ocid        = var.compartment_ocid
    cloud_init_script       = "${file("${path.module}/scripts/config.sh")}"
    subnet_id               = var.private_subnet_id
    ssh_public_key          = var.ssh_authorized_key
    instance_shape          = var.instance_shape
    instance_image          = var.instance_image
    memory                  = var.instance_config.memory_in_gbs
    ocpus                   = var.instance_config.ocpus
    boot_volume_size_in_gbs = var.instance_config.boot_volume_size_in_gbs
    vm_name                 = "${var.display_name}"
    availabilitydomain      = var.availability_domain
   
}