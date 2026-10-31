variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "boot_diag_uri" {
  type = string
}

variable "avset_id" {
  type = string
}

variable "vm_count" {
  type = number
}

variable "vm_name_prefix" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "os_disk_caching" {
  type = string
}

variable "os_disk_storage_type" {
  type = string
}

variable "image_publisher" {
  type = string
}

variable "image_offer" {
  type = string
}

variable "image_sku" {
  type = string
}

variable "image_version" {
  type = string
}

variable "tags" {
  type = map(string)
}