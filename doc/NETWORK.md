# 
# NETWORKING
#

https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux

https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking

# sudo ip link add link eno1 name eno1.2 type vlan id 2

sudo brctl addbr vbr1

# sudo brctl addif vbr1 eno1.2

sudo ip link set dev vbr1 up

sudo ifconfig vbr1 192.168.120.100

# works

https://superuser.com/questions/752954/need-to-do-bridged-adapter-only-in-vagrant-no-nat

config.vm.network "public_network", ip: "192.168.0.17"

# default router
config.vm.provision "shell",
  run: "always",
  inline: "route add default gw 192.168.0.1"

# default router ipv6
config.vm.provision "shell",
  run: "always",
  inline: "route -A inet6 add default gw fc00::1 eth1"

# delete default gw on eth0
config.vm.provision "shell",
  run: "always",
  inline: "eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`"




sudo virsh net-edit default

  <network>
  <name>default</name>
  <uuid>f6dc4573-ec7c-4612-91fe-5f6d821b9c3d</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:75:fb:16'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.99'/>
      <host mac='52:54:00:F6:4D:86' name='centos8' ip='192.168.122.11'/>
    </dhcp>
  </ip>
</network>