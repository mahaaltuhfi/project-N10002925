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