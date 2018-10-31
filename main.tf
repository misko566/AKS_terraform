#init-------------------------------------------------------------------

provider "azurerm" {
    version = "=1.5.0"
}

terraform {
    required_version = "~> 0.11.1"
  backend "azurerm" {
    storage_account_name = "terraformtf"
    container_name       = "terraform"
    key                  = "k8s.terraform.tfstate"
    access_key = "insert your access key for blob"
  }
}
#how to create blob http://www.blueshift.dk/blog/terraform-remote-state-azure
#end of init-------------------------------------------------------------------

resource "azurerm_resource_group" "k8s" {
        name = "${var.resource_group_name}"
        location = "${var.location}"
}



resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  dns_prefix          = "${var.dns_prefix}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }
  kubernetes_version = "1.11.2"

  agent_pool_profile {
    name            = "${var.node_name}"
    count           = "${var.agent_count}"
    vm_size         = "${var.node_size}"
    os_type         = "Linux"
    os_disk_size_gb = "${var.node_disk_size}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  tags {
    Environment = "${var.dns_prefix}"
  }
}