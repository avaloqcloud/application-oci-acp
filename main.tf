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
    assign_public_ip = false
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
  
  }
  timeouts {
    create = "60m"
  }
}

data "template_file" "config" {
  depends_on = [oci_core_instance.acp_vm]
  template = "${file("${path.module}/templates/config.tpl")}"
  vars = {
    acp_ip_address  = oci_core_instance.acp_vm.private_ip
  }
}

resource "null_resource" "copy_config" {
  depends_on = [data.template_file.config, oci_core_instance.acp_vm]
  provisioner "file" {
    connection {
      agent               = false
      timeout             = "10m"
      host                = oci_core_instance.acp_vm.private_ip
      user                = "opc"
      private_key         = var.ssh_private_key
      bastion_host        = var.bastion_public_ip
      bastion_private_key = var.ssh_private_key
      bastion_user        = "opc"
    }
  
    content = "${data.template_file.config.rendered}"
    destination = "~/config.sh"
  } 
}

resource "null_resource" "configure" {
  depends_on = [null_resource.copy_config]
  provisioner "remote-exec" {
    connection {
      agent               = false
      timeout             = "10m"
      host                = oci_core_instance.acp_vm.private_ip
      user                = "opc"
      private_key         = var.ssh_private_key
      bastion_host        = var.bastion_public_ip
      bastion_private_key = var.ssh_private_key
      bastion_user        = "opc"
    }
    inline = [
      "chmod 755 ~/config.sh",
      "sudo /home/opc/config.sh > /home/opc/config.log",
      "sudo shutdown -r +2"
    ]
  }
  provisioner "local-exec" {
    command = "sleep 60s"
  }
}