# 4)
sudo /usr/sbin/iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j REJECT --reject-with tcp-reset
sudo /usr/sbin/iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT
