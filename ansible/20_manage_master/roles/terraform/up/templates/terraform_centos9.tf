# # variable "vm_name" {
# #   type = string
# #   default = "## item ##"
# # }

# # variable "domain" {
# #   type = string
# #   default = "pfistera.ch"
# # }

# # variable "memory" {
# #   type = string
# #   default = "2048"
# # }

# # variable "cpu" {
# #   type = number
# #   default = 2
# # }

# provider "libvirt" {
#   uri = "qemu:///system"
# }

# resource "libvirt_pool" "cluster" {
#   name = "k3spool"
#   type = "dir"
#   path = "/var/terraform/cluster_storage"
# }

# resource "libvirt_volume" "qcow_volume" {
#   name = "master1.img"
#   pool = "k3spool"
#   source = "http://ftp.gwdg.de/pub/linux/almalinux/8.6/cloud/x86_64/images/AlmaLinux-8-GenericCloud-8.6-20220513.x86_64.qcow2"
#   format = "qcow2"
# }


# data "template_file" "user_data" {
#   template = file("${path.module}/cloud_init.cfg")

#   vars = {
#    hostname = "master1"
#    domain = "pfistera.ch"
#   }
# }

# resource "libvirt_cloudinit_disk" "commoninit" {
#   name           = "commoninit_master1.iso"
#   user_data      = data.template_file.user_data.rendered
#   pool           = "k3spool"
# }


# resource "libvirt_domain" "default" {
  
#   name   = "master1"
#   memory = "2048"
#   vcpu   = "2"
#   # autostart = true

#   cloudinit = libvirt_cloudinit_disk.commoninit.id

#   disk {
#     volume_id = libvirt_volume.qcow_volume.id
#   }

#   console {
#     type = "pty"
#     target_type = "serial"
#     target_port = "0"
#   }

#   graphics {
#     type        = "vnc"
#   }


#   network_interface {
#     network_name = "k3snet"
#     # bridge = "k3snet"
#     network_id     = "eth0"
#     hostname = "master1"
#     # addresses      = ["192.168.122.120"]
#     # mac = "## hostvars[item].mac ##"
#     # wait_for_lease = true
#   }

# }




terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.13"
    }
  }
}

# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "ubuntu" {
  name = "ubuntu"
  type = "dir"
  path = "/tmp/terraform-provider-libvirt-pool-ubuntu"
}

# We fetch the latest ubuntu release image from their mirrors
resource "libvirt_volume" "ubuntu-qcow2" {
  name   = "ubuntu-qcow2"
  pool   = libvirt_pool.ubuntu.name
  source = "https://cloud-images.ubuntu.com/releases/xenial/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}

# for more info about paramater check this out
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/cloudinit.html.markdown
# Use CloudInit to add our ssh-key to the instance
# you can add also meta_data field
resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.ubuntu.name
}

# Create the machine
resource "libvirt_domain" "domain-ubuntu" {
  name   = "ubuntu-terraform"
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
  }

  # IMPORTANT: this is a known bug on cloud images, since they expect a console
  # we need to pass it
  # https://bugs.launchpad.net/cloud-images/+bug/1573095
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.ubuntu-qcow2.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}