#!/bin/bash
sudo iptables -I INPUT -s 172.16.1.0/24 -p tcp --dport 50000 -j ACCEPT
sudo iptables -I OUTPUT -s 172.16.1.0/24 -p tcp --sport 50000 -j ACCEPT
