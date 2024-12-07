
see https://github.com/bertvv/ansible-dnsmasq

 ap-profile $ hostname
somsi
 ap-profile $ grep -v '#' /etc/dnsmasq.conf  | grep -v -e '^$'
port=53
domain-needed
bogus-priv
server=/localnet/192.168.0.110
address=/localnet/192.168.0.110
listen-address=192.168.0.110
