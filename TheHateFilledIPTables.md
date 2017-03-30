# List nat rules

```sudo iptables -t nat -L --line-numbers```

# Delete rules

```sudo iptables -t nat -D PREROUTING <rule_num>```

```sudo iptables -t nat -D POSTROUTING <rule_num>```

# Add rules
## Forward 8090 traffic to destination IP 192.168.0.50 and destination port 22

```sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8090 -j DNAT --to-destination 192.168.0.50:22```
```sudo iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 8090 -d 192.168.0.50 -j SNAT --to-source 192.168.0.12```
