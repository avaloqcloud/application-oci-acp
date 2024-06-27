# Required by the OCI Provider
variable "compartment_ocid" {
  type =        string
  description = "Compartment OCID"
}

variable "availability_domain" {
  type =        string
  description = "Availability Domain"
}

variable "private_subnet_id" {
  type =        string
  description = "OCID of private subnet in which to create a instance"
}

variable "ssh_authorized_key" {
  type =        string
  description = "RSA public key in PEM format. It will added as authorized key for remote connection over SSH"
}

variable "display_name" {
  type = string
  description = "Name of the ACP instance"
}

variable "private_ip" {
  type = string
  description = "A private IP address of your choice to assign to the VNIC. Must be an available IP address within the subnet's CIDR."
  default = ""
}

variable "instance_image" {
  type = string
}

variable "instance_shape" {
  type = string
}

variable "instance_config" {
  type = object({
    ocpus = string
    memory_in_gbs = string
    boot_volume_size_in_gbs = string
  })

  default = {
    ocpus                 = "6"
    memory_in_gbs        = "48"
    boot_volume_size_in_gbs = "700"
  }
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Specify the tag for the OCI resources in map(string)"
}

variable "nsg_ids" {
  type        = list(string)
  description = "List of Network Security Group IDs"
  default     = []
}