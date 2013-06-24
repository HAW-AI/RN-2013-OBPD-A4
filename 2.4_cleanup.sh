#!/bin/bash
sudo /usr/sbin/iptables -D OUTPUT -p icmp -m state --state NEW -j ACCEPT
sudo /usr/sbin/iptables -D INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT
sudo /usr/sbin/iptables -D INPUT -p icmp -m state --state NEW -j DROP

