# ===============
# Variables
# ===============

variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "infra-network"
}

variable "net_cidr" {
  description = "Subnet structure"
  type = list(object({
    name = string,
    zone = string,
    prefix = string
  }))

  default = [
    { name = "infra-subnet-a", zone = "ru-central1-a", prefix = "10.129.1.0/24" },
    { name = "infra-subnet-b", zone = "ru-central1-b", prefix = "10.130.1.0/24" },
    { name = "infra-subnet-d", zone = "ru-central1-d", prefix = "10.131.1.0/24" },
  ]
}

variable "vm_1_name" {
  type = string
  default = "vm-kittygram"
}

variable "aws_region" {
  description = "AWS Region name"
  type = string
}

variable "ssh_key" {
  description = "SSH Public Key"
  type = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type = string
}

variable "folder_id" {
  description = "Folder ID"
  type = string
}

variable "image_family" {
  description = "Image Family (ubuntu-2004-lts)"
  type = string
}

variable "zone" {
  description = "Zone (ru-central1-a)"
  type = string
}

variable "cores" {
  description = "Number of cores"
  type = number
}

variable "memory" {
  description = "Amount of memory in Gbytes"
  type = number
}

variable "disk_size" {
  description = "Disk size in Gbytes"
  type = number
}

variable "platform_id" {
  description = "Platform (physical processor https://yandex.cloud/ru/docs/compute/concepts/vm-platforms)"
  type = string
}

variable "disk_type" {
  description = "Type of disk (network-ssd/network-hdd/...)"
  type = string
}

variable "nat" {
  description = "NAT should be set to true for VM to get public IP"
  type = bool
}