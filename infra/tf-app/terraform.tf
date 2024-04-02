terraform {
  required_version = ">= 1.3.6"

  backend "azurerm" {
    resource_group_name  = "ozhi0001-githubactions-rg"
    storage_account_name = "ozhi0001githubactionssa"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}