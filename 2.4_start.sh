#!/bin/bash
sudo /usr/sbin/iptables -I OUTPUT -p icmp -m state --state NEW -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT
sudo /usr/sbin/iptables -I INPUT -p icmp -m state --state NEW -j DROP

