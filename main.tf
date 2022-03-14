terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

module "lb_module" {
  source = "./modules/vm/"

  vm_count = 2
  vm_hostname_prefix = "lb"
  vcpu = 1
  memory = "512"
  pool = "hd"
  system_volume = 20
  
  dhcp = false
  ip_address = [
                "192.168.122.101",
                "192.168.122.102"
                ]
  ip_gateway = "192.168.122.1"
  ip_nameserver = "192.168.122.1"

  local_admin = "local-admin"
  ssh_admin = "root"
  local_admin_passwd = "centos"
  ssh_private_key = "~/.ssh/id_rsa"
  ssh_keys    = [ 
    "ssh-rsa AAAAB3N", 
    ]
  
  time_zone   = "UTC"
  os_img_url  = "/home/marcones/dados/Isos/centos7-disk001.qcow2"
}

module "k8smaster_module" {
  source = "./modules/vm/"

  vm_count = 3
  vm_hostname_prefix = "k8smaster"
  vcpu = 2
  memory = "2048"
  pool = "hd"
  system_volume = 20
  
  dhcp = false
  ip_address = [
                "192.168.122.110",
                "192.168.122.111",
                "192.168.122.112"
                ]
  ip_gateway = "192.168.122.1"
  ip_nameserver = "192.168.122.1"

  local_admin = "local-admin"
  ssh_admin = "root"
  local_admin_passwd = "centos"
  ssh_private_key = "~/.ssh/id_rsa"
  ssh_keys    = [ 
    "ssh-rsa AAAAB3N", 
    ]
  
  time_zone   = "UTC"
  os_img_url  = "/home/marcones/dados/Isos/centos7-disk001.qcow2"
}

module "k8sworker_module" {
  source = "./modules/vm/"

  vm_count = 1
  vm_hostname_prefix = "k8sworker"
  vcpu = 2
  memory = "2048"
  pool = "hd"
  system_volume = 20  
  
  ip_address = [
                "192.168.122.201"
                ]
  ip_gateway = "192.168.122.1"
  ip_nameserver = "192.168.122.1"

  local_admin = "local-admin"
  ssh_admin = "root"
  local_admin_passwd = "centos"  
  ssh_private_key = "~/.ssh/id_rsa"
  ssh_keys    = [ 
    "ssh-rsa AAAAB3N", 
    ]
  
  time_zone   = "UTC"
  os_img_url  = "/home/marcones/dados/Isos/centos7-disk001.qcow2"
}