terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "ozhi0001-githubactions-rg"
  location = "canadacentral"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "ozhi0001githubactionssa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

provider "azurerm" {
  features {}
}