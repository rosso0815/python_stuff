
# https://github.com/rgl/terraform-libvirt-ubuntu-example
# see https://github.com/hashicorp/terraform

terraform {
  required_version = "1.3.6"
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/random
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
    # see https://registry.terraform.io/providers/hashicorp/template
    template = {
      source = "hashicorp/template"
      version = "2.2.0"
    }
    # see https://registry.terraform.io/providers/dmacvicar/libvirt
    # see https://github.com/dmacvicar/terraform-provider-libvirt
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.0"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_network" "default_network" {
  name = "default"
  mode = "nat"
  addresses = ["192.168.124.0/24"]
  autostart = true
}


{% for item in items %}
data "template_file" "user_data_{{ item[0] }}" {
  template = file("${path.module}/cloud_init_{{ item[0] }}.cfg")
}
{% endfor %}

{% for item in items %}
data "template_file" "network_config_{{ item[0] }}" {
    template = file("${path.module}/cloud_init_network_{{ item[0] }}.cfg")
}
{% endfor %}

resource "libvirt_pool" "default" {
    name = "default"
    type = "dir"
    path = "/var/terraform/pool"
}

{% for item in items %}
resource "libvirt_cloudinit_disk" "{{ item[0] }}_cloudinit" {
  name = "{{ item[0] }}_cloudinit.iso"
  pool = "default"
  user_data      = data.template_file.user_data_{{ item[0] }}.rendered
  network_config = data.template_file.network_config_{{ item[0] }}.rendered
}
{% endfor %}

# this uses the vagrant ubuntu image imported from https://github.com/rgl/ubuntu-vagrant.
# see https://github.com/dmacvicar/terraform-provider-libvirt/blob/v0.6.14/website/docs/r/volume.html.markdown
#
{% for item in items %}
resource "libvirt_volume" "{{ item[0] }}_root" {
    name = "{{ item[0] }}_root.img"
    pool = "default"
    # source = "http://ftp.gwdg.de/pub/linux/almalinux/8.6/cloud/x86_64/images/AlmaLinux-8-GenericCloud-8.6-20220513.x86_64.qcow2"
    #source = "https://ftp.gwdg.de/pub/linux/rocky/8/images/x86_64/Rocky-8-GenericCloud-Base-8.7-20221130.0.x86_64.qcow2" 
    source = "https://ftp.gwdg.de/pub/linux/rocky/9.1/images/x86_64/Rocky-9-GenericCloud-Base-9.1-20221130.0.x86_64.qcow2"
    format = "qcow2"
}
{% endfor %}

{% for item in items %}
resource "libvirt_domain" "{{ item[0] }}" {
  name = "{{ item[0] }}"
  autostart = true
  vcpu = 2
  memory = 2048
  machine = "pc-q35-rhel9.0.0"
  qemu_agent = true
  cloudinit = libvirt_cloudinit_disk.{{ item[0] }}_cloudinit.id

  console {
    type = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  
  boot_device {
   dev = [ "hd", "network"]
  }

  graphics {
    type        = "vnc"
  }

  disk {
    volume_id = libvirt_volume.{{ item[0] }}_root.id
    scsi = true
  }
  
 network_interface {
    network_id = libvirt_network.default_network.id
    hostname   = "{{ item[0] }}"
  }

}

{% endfor %}
