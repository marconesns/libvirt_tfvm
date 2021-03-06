resource "libvirt_volume" "volume-qcow2" {
  count  = var.vm_count
  name   = format("${var.vm_hostname_prefix}%02d.qcow2", count.index + var.index_start)
  pool   = var.pool
  size   = 1024*1024*1024*var.system_volume
  base_volume_id = var.os_img_url

  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  count          = var.vm_count
  name           = format("${var.vm_hostname_prefix}_init%2d.iso", count.index + 1)
  user_data      = data.template_cloudinit_config.init_config[count.index].rendered
  network_config = data.template_file.network_config[count.index].rendered
  pool           = var.pool
}