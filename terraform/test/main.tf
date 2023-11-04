terraform {
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = "fastapi-terraform"
    key                  = "test/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  environment_name = "test"
}

module "azure_web_app" {
  source = "../azure_web_app"

  webapp_name = "app-fastapi-${local.environment_name}"
}