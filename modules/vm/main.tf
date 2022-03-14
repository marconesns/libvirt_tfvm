terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

resource "libvirt_domain" "virt-machine" {
  count = var.vm_count
  name = format("${var.vm_hostname_prefix}%02d", count.index + var.index_start)
  vcpu = var.vcpu
  memory = var.memory
  qemu_agent = true  
  
  cloudinit = element(libvirt_cloudinit_disk.commoninit.*.id, count.index)

  network_interface {
    hostname = format("${var.vm_hostname_prefix}%02d", count.index + var.index_start)
    wait_for_lease = true
    bridge = var.bridge
  }

  disk {
    volume_id = element(libvirt_volume.volume-qcow2.*.id, count.index)
  }

#     provisioner "remote-exec" {
#     inline = [
#       "echo \"Virtual Machine \"$(hostname)\" is UP!\"",
#       "date"
#     ]
#     connection {
#       type                = "ssh"
#       user                = var.ssh_admin
#       host                = self.network_interface.0.addresses[0]
#       private_key         = var.ssh_private_key != null ? file(var.ssh_private_key): null
#       timeout             = "2m"
#     }
#   }
}

