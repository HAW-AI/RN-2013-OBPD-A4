#!/bin/bash
sudo iptables -I INPUT -s 172.16.1.0/24 -j DROP
sudo iptables -I OUTPUT -s 172.16.1.0/24 -j DROP

