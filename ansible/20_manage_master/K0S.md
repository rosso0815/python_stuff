

https://traefik.io/blog/from-zero-to-hero-getting-started-with-k0s-and-traefik/

https://docs.k0sproject.io/v1.23.3+k0s.1/k0s-multi-node/


restrict dhcp server to avoid clashes on dhcp-server as we need 2 network interfaces ( dhcp AND static )

```

cat /etc/libvirt/qemu/networks/default.xml

<network>
  <name>default</name>
  <uuid>b6c0276f-9a74-40fe-ab5d-03d2ba75c15e</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:3f:92:7b'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.100'/>
    </dhcp>
  </ip>
</network>

```
