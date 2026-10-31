locals {
  common_tags = {
    Project        = "CCGC 5502 Terraform Project"
    Name           = "maha.Al-Tuhfi"
    ExpirationDate = "2027-12-31"
    Environment    = "Learning"
  }
}

module "rgroup" {
  source   = "./modules/rgroup-2925"
  rg_name  = "2925-RG"
  location = "canadacentral"
  tags     = local.common_tags
}
module "network" {
  source                  = "./modules/network-2925"
  rg_name                 = module.rgroup.rg_name
  location                = module.rgroup.location
  vnet_name               = "2925-VNET"
  vnet_address_space      = ["10.0.0.0/16"]
  subnet_name             = "2925-SUBNET"
  subnet_address_prefixes = ["10.0.1.0/24"]
  nsg_name                = "2925-NSG"
  tags                    = local.common_tags

  inbound_rules = {
    SSH   = { port = 22, priority = 100 }
    RDP   = { port = 3389, priority = 110 }
    WinRM = { port = 5985, priority = 120 }
    HTTP  = { port = 80, priority = 130 }
  }
}

module "common" {
  source             = "./modules/common-2925"
  rg_name            = module.rgroup.rg_name
  location           = module.rgroup.location
  law_name           = "2925-LAW"
  law_sku            = "PerGB2018"
  law_retention_days = 30
  rsv_name           = "r2925-RSV"
  rsv_sku            = "Standard"
  sa_name            = "2925commonsamaha"
  sa_tier            = "Standard"
  sa_replication     = "LRS"
  tags               = local.common_tags
}