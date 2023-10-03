# Required by the OCI Provider
variable "compartment_id" {
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

variable "bastion_public_ip" {
  type =        string
  description = "Public IP of bastion machine"
}

variable "ssh_private_key" {
  type =        string
  description = "SSH Private key in PEM format. The private key will be used for connecting to the acp VM over SSH"
}

variable "sandbox_name" {
  type = string
  description = "Name of the sandbox"
}