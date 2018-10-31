variable "resource_group_name" {
  description = "resource_group_name"
  default     = "k8s"
}

variable "location" {
  description = "location"
  default     = "westeurope"
}


variable "cluster_name" {
  description = "cluster_name"
  default     = "k8s"
}


variable "dns_prefix" {
  description = "dns_prefix"
  default     = "k8s"
}


variable "ssh_public_key" {
  description = "ssh_public_key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "agent_count" {
  description = "agent_count"
  default     = "2"
}

variable "client_id" {
  description = "client_id service_principal"
  default     = ""
}


variable "client_secret" {
  description = "client_secret  service_principal"
  default     = ""
}

variable "node_name" {
  description = "node_name"
  default     = "default"
}

variable "node_size" {
  description = "node_size"
  default     = "Standard_A0"
}

variable "node_disk_size" {
  description = "node_disk_size"
  default     = "30"
}