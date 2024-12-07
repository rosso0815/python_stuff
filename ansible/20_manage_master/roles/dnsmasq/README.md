
see 
    
    https://github.com/bertvv/ansible-dnsmasq

    https://github.com/mrlesmithjr/ansible-dnsmasq/blob/master/defaults/main.yml

 ap-profile $ hostname
somsi
 ap-profile $ grep -v '#' /etc/dnsmasq.conf  | grep -v -e '^$'
port=53
domain-needed
bogus-priv
server=/localnet/192.168.0.110
address=/localnet/192.168.0.110
listen-address=192.168.0.110



# Test the config file and refuse starting if it is not valid.
ExecStartPre=sleep 60
# ExecStartPre=timeout 180s bash -c 'until ip a s dev wlan0; do sleep 1; done'
