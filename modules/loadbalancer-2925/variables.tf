variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "lb_pip_name" {
  type = string
}

variable "frontend_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "probe_port" {
  type = number
}

variable "rule_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "nic_ids" {
  description = "VM name => NIC ID"
  type        = map(string)
}

variable "ipconfig_names" {
  description = "VM name => NIC ip configuration name"
  type        = map(string)
}

variable "tags" {
  type = map(string)
}