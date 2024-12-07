


curl -v --interface eno1 http://www.google.ch
curl -v --interface wlp0s20f3 http://www.google.ch

wlp0s20f3

netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.0.1     0.0.0.0         UG        0 0          0 wlp0s20f3
192.168.0.0     0.0.0.0         255.255.255.0   U         0 0          0 wlp0s20f3
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eno1


 cat /etc/iproute2/rt_tables
 
 1  wlp0s20f3
 2  eno1


iptables -F

iptables -X

# 

iptables -A INPUT -m state --state NEW -j LOG --log-prefix='[iptables_input] '
iptables -A OUTPUT -m state --state NEW -j LOG --log-prefix='[iptables_output] '

iptables -t nat -A POSTROUTING -o wlp0s20f3 -j MASQUERADE
iptables -A FORWARD -i eno1 -o wlp0s20f3 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eno1 -o wlp0s20f3 -j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to-source 192.168.0.110  

https://jensd.be/468/linux/two-network-cards-rp_filter

https://www.google.com/search?q=centos+forward+ethernet+to+wifi&sxsrf=APwXEde91lCrxHKYwMg4Yxw5qGz7Mgs-Yg%3A1679941532066&ei=nN8hZPbHA7qQ9u8Phf2ncA&oq=centos+forward+ethernet++wifi&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAxgAMggIIRCgARDDBDIICCEQoAEQwwQ6CgghEKABEMMEEApKBAhBGABQAFj0SmCXX2gAcAF4AIABqAGIAZ4QkgEEMTIuOZgBAKABAcABAQ&sclient=gws-wiz-serp

https://www.nesociety.org/tutorials/linux-centos/how-to-share-internet-connectivity-by-enabling-ip-fowarding-in-centos/#.ZCHhXexBwUE

https://superuser.com/questions/1332956/how-can-i-turn-my-centos-laptop-into-a-wireless-signal-repeater

iptables -P INPUT ACCEPT
iptables -F INPUT 
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT 
iptables -P FORWARD DROP
iptables -F FORWARD 
iptables -t nat -F
iptables -A INPUT -m state --state NEW -j LOG --log-prefix='[iptables_input] '
iptables -A OUTPUT -m state --state NEW -j LOG --log-prefix='[iptables_output] '

iptables -A FORWARD -i wlp0s20f3 -o eno1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eno1 -o wlp0s20f3 -j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o wlp0s20f3 -j MASQUERADE 
iptables -t nat -A POSTROUTING -o wlp0s20f3 -j MASQUERADE

iptable -L
iptables -t nat -L

ping -I wlp0s20f3 8.8.8.8