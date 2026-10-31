variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "law_name" {
  type = string
}

variable "law_sku" {
  type = string
}

variable "law_retention_days" {
  type = number
}

variable "rsv_name" {
  type = string
}

variable "rsv_sku" {
  type = string
}

variable "sa_name" {
  type = string
}

variable "sa_tier" {
  type = string
}

variable "sa_replication" {
  type = string
}

variable "tags" {
  type = map(string)
}