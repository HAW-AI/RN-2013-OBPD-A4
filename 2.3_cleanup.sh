#!/bin/bash
sudo /usr/sbin/iptables -D OUTPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
sudo /usr/sbin/iptables -D INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j DROP
sudo /usr/sbin/iptables -D INPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT
sudo /usr/sbin/iptables -D OUTPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT
sudo /usr/sbin/iptables -D INPUT -s 172.16.1.0/24 -p udp --dport 50001 -j ACCEPT
