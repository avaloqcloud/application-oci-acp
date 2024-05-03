module "acp" {

    source = "github.com/avaloqcloud/terraform-oci-compute"#?ref=3a035ba85b8dc487d8c7faf1293575588eb1af7b"
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
    private_ip              = var.private_ip
    availabilitydomain      = var.availability_domain
    defined_tags            = var.resource_tags
}