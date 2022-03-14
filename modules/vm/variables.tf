variable "vm_hostname_prefix" {
  description = "Nome da vm"
  default = "k8s"
  type = string
}

variable "memory" {
  description = "Memoria da vm"
  default = "512"
  type = string
}

variable "vcpu" {
  description = "cpu da vm"
  default = 1
  type = number
}

variable "ip_address" {
  description = "Endereço ip"
  type = list(string)
}

variable "os_img_url" {
  description = "Url para imagem do SO"
  default = "/home/marcones/dados/Isos/centos7-disk001.qcow2"
}

variable "pool" {
  description = "Storage pool name"
  default = "default"
}

variable "index_start" {
  description = "From where the indexig start"
  default = 1
}

variable "vm_count" {
  description = "Number of VMs"
  default = 1
}

variable "system_volume" {
  description = "System Volume size (GB)"
  default = 10
}

variable "dhcp" {
  description = "Use DHCP or Static IP settings"
  type        = bool
  default     = false
}

variable "bridge" {
  description = "Bridge interface"
  default     = "virbr0"
}

variable "ip_nameserver" {
  description = "IP addresses of a nameserver"
  default     = "192.168.122.1"
}

variable "ip_gateway" {
  description = "IP addresses of a gateway"
  default     = "192.168.122.1"
}

variable "ssh_admin" {
  description = "Admin user with ssh access"
  default = "ssh-admin"
}

variable "ssh_keys" {
  description = "List of public ssh keys"
  type        = list(string)
  default     = []
}

variable "local_admin" {
  description = "Admin user without ssh access"
  default     = ""
}

variable "local_admin_passwd" {
  description = "Local admin user password"
  default     = "password_example"
}

variable "time_zone" {
  description = "Time Zone"
  default     = "UTC"
}

variable "ssh_private_key" {
  description = "Private key for SSH connection test"
  default     = null
}