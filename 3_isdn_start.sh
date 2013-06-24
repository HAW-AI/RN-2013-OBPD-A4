#!/bin/bash
sudo /sbin/route add -net 192.168.17.0/24 gw 192.168.18.1
sudo /sbin/route add -net 192.168.18.0/24 gw 192.168.17.1

