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
  description = "OCID of private subnet in which to create a Bastion host"
}

variable "ssh_authorized_key" {
  type =        string
  description = "RSA public key in PEM format. It will added as authorized key for remote connection over SSH"
}
variable "display_name" {
  type = string
  description = "Name of the sandbox"
}

variable "instance_image" {
  type = string
}

variable "instance_shape" {
  type = string
}
