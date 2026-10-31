terraform {
  backend "azurerm" {
    resource_group_name  = "2925-tfstate-RG"
    storage_account_name = "2925tfstatemaha"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    use_cli              = true
  }
}