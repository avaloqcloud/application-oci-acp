resource "oci_core_instance" "acp_vm" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "${var.sandbox_name}-sandbox-acp"
  freeform_tags       = {"sandbox-name"="${var.sandbox_name}"}
  shape               = "VM.Standard.E4.Flex"

  shape_config {
    memory_in_gbs = 48
    ocpus = 6
  }
 
  create_vnic_details {
    subnet_id        = var.private_subnet_id
    display_name     = "${var.sandbox_name}-sandbox-acp"
    assign_public_ip = true
    hostname_label   = "sandbox-acp"
    freeform_tags    = {"sandbox-name"="${var.sandbox_name}"}
  }
 
  source_details {
    source_type = "image"
    source_id = "ocid1.image.oc1.eu-zurich-1.aaaaaaaadugtpwjc3ow46zisu4z35whv6xrvpxhlnkc7lupi3cu7hw57xica"
    boot_volume_size_in_gbs = "300"
  } 
  
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_key
    user_data = "${base64encode(file("${path.module}/scripts/config.sh"))}"
  }
  timeouts {
    create = "60m"
  }
}