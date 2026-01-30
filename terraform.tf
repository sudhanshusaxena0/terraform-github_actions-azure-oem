terraform {
  required_version = ">= 1.0.11"
  required_providers {
    azurerm = {
      version = ">= 4.10.0"
      source  = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "__TF-RG__"
    storage_account_name = "__TF-STG-ACCT__"
    container_name       = "__TF-STG-CONTAINER__"
    key                  = "terraform.tfstate"
  }
}
