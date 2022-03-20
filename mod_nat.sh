#!/bin/bash
echo "Добавляем NAT"
sleep 10
ip r | grep tun0| awk '/tun0 proto kernel*/ {print $1}' | xargs -0 \
iptables -t nat -A POSTROUTING -s $net -o eth0 -j MASQUERADE
