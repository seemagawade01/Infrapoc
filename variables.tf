variable "linux_instance_type" {
  type        = string
  description = "VM instance type for Linux Server"
  default     = "n1-standard-2"  #n1-standard-2 (2 vCPU, 7.5 GB memory)
}

variable "cis-rhel-8-lvl-1" {
  type        = string
  description = "Red Hat Enterprise Linux 8 level 1"
  #default     = "cis-red-hat-enterprise-linux-8-level-1-v2-0-0-9"
  default     ="https://www.googleapis.com/compute/v1/projects/cis-public/global/images/cis-red-hat-enterprise-linux-8-level-1-v2-0-0-9"
}
