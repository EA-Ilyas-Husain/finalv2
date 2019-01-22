# provider.tf variables
        # provider block

variable "project" {
        default = "clarapcp-ea-ilyas-husein"
}
variable "region" {
        default = "us-east1"
}
variable "credentials" {
        default = "~/creds/serviceaccount.json"
}

# instance.tf variables
        # resource block

variable "name" {
        default = "jenkins"
}
variable "machine_type" {
        default = "g1-small"
}
variable "zone" {
        default = "us-east1-c"
}
variable "zone2" {
        default = "us-east1-b"
}

variable "image" {
        default = "packer-1547982783"
}
variable "tags" {
        default = ["ssh", "jenkins", "http-server"]
}
variable "network" {
        default = "claranet-test"
}
variable "ssh_user" {
        default = "terraform"
}

# firewall.tf variables
	# resource block
variable "allowed_ports" {
        default = ["22"]
}


variable "username" {
  default = "admin"
}



