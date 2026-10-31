variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_ids" {
  description = "VM name => VM ID"
  type        = map(string)
}

variable "disk_size_gb" {
  type = number
}

variable "disk_storage_type" {
  type = string
}

variable "disk_caching" {
  type = string
}

variable "lun" {
  type = number
}

variable "tags" {
  type = map(string)
}