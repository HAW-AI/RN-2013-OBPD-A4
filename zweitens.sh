# 1)
# set up
sudo iptables -I INPUT -s 172.16.1.0/24 -j DROP
sudo iptables -I OUTPUT -s 172.16.1.0/24 -j DROP

# clean up
sudo iptables -D INPUT -s 172.16.1.0/24 -j DROP
sudo iptables -D OUTPUT -s 172.16.1.0/24 -j DROP



# 2)
sudo iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
sudo iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT

# 3)
sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j DROP


# 4)
sudo /usr/sbin/iptables -I OUTPUT -p icmp -m state --state NEW -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state NEW -j DROP
