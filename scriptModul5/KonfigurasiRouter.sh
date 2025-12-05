# 2. Osgiliath (router inti) – PAKAI ETH YANG SUDAH BENAR
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1 eth2 eth3; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ NAT1 (dipakai Misi 2, sekarang belum penting)
ip addr add 10.75.2.10/29 dev eth0

# eth2 ↔ Meria
ip addr add 10.75.2.17/29 dev eth2

# eth1 ↔ Rivendell
ip addr add 10.75.2.25/29 dev eth1

# eth3 ↔ DHCPRelayMinastir
ip addr add 10.75.2.33/29 dev eth3

# --- ROUTING ---

# Kiri via Meria
ip route add 10.75.3.0/29   via 10.75.2.18   # IronHills
ip route add 10.75.1.128/26 via 10.75.2.18   # Durin
ip route add 10.75.2.0/29   via 10.75.2.18   # Khamul

# Server bawah via Rivendell
ip route add 10.75.3.8/29   via 10.75.2.26   # Vilya & Narya

# Kanan via Minastir
ip route add 10.75.0.0/24   via 10.75.2.34   # Elendil
ip route add 10.75.1.192/27 via 10.75.2.34   # Isildur
ip route add 10.75.3.16/29  via 10.75.2.34   # Palantir
ip route add 10.75.1.0/25   via 10.75.2.34   # Gilgalad
ip route add 10.75.1.224/27 via 10.75.2.34   # Cirdan

# 3. Meria
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1 eth2; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ Osgiliath
ip addr add 10.75.2.18/29 dev eth0

# eth1 ↔ Switch1 ↔ IronHills
ip addr add 10.75.3.6/29 dev eth1    # gateway IronHills

# eth2 ↔ Wilderland
ip addr add 10.75.2.41/29 dev eth2

# Subnet di belakang Wilderland
ip route add 10.75.1.128/26 via 10.75.2.42   # Durin
ip route add 10.75.2.0/29   via 10.75.2.42   # Khamul

# Naik ke Osgiliath
ip route add default via 10.75.2.17

# 4. Wilderland
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1 eth2; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ Meria
ip addr add 10.75.2.42/29 dev eth0

# eth1 ↔ Durin
ip addr add 10.75.1.190/26 dev eth1   # gateway Durin

# eth2 ↔ Switch5 ↔ Khamul
ip addr add 10.75.2.6/29 dev eth2     # gateway Khamul

ip route add default via 10.75.2.41

# 5. Rivendell (ingat: eth0 ke Osgiliath, eth1 ke Vilya+Narya)
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ Osgiliath
ip addr add 10.75.2.26/29 dev eth0

# eth1 ↔ Switch4 ↔ Vilya & Narya
ip addr add 10.75.3.14/29 dev eth1    # gateway Vilya+Narya

ip route add default via 10.75.2.25

# 6. DHCPRelayMinastir
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1 eth2; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ Osgiliath
ip addr add 10.75.2.34/29 dev eth0

# eth1 ↔ Switch3 ↔ Elendil & Isildur
ip addr add 10.75.0.254/24 dev eth1   # GW Elendil
ip addr add 10.75.1.222/27 dev eth1   # GW Isildur

# eth2 ↔ Pelargir
ip addr add 10.75.2.49/29 dev eth2

# Subnet di belakang Pelargir
ip route add 10.75.3.16/29  via 10.75.2.50   # Palantir
ip route add 10.75.1.0/25   via 10.75.2.50   # Gilgalad
ip route add 10.75.1.224/27 via 10.75.2.50   # Cirdan

ip route add default via 10.75.2.33

# 7. Pelargir
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

for i in eth0 eth1 eth2; do
  ip addr flush dev $i 2>/dev/null
done
ip route flush table main

# eth0 ↔ Minastir
ip addr add 10.75.2.50/29 dev eth0

# eth1 ↔ AnduinBanks
ip addr add 10.75.2.57/29 dev eth1

# eth2 ↔ Palantir
ip addr add 10.75.3.22/29 dev eth2    # gateway Palantir

# Subnet di belakang AnduinBanks
ip route add 10.75.1.0/25   via 10.75.2.58   # Gilgalad
ip route add 10.75.1.224/27 via 10.75.2.58   # Cirdan

ip route add default via 10.75.2.49

# 8. DHCPRelayAnduinBanks
# Nyalakan IPv4 forward
sysctl -w net.ipv4.ip_forward=1

# Bersihkan IP & route lama
ip addr flush dev eth0
ip addr flush dev eth1
ip route flush table main
#Lalu set IP sesuai topologi (asumsi:
#eth0 ↔ Pelargir (/29), eth1 ↔ Switch2 (LAN Gilgalad/Cirdan)):

#bash
#Salin kode
# eth0 ↔ Pelargir (link /29 10.75.2.56/29)
ip addr add 10.75.2.58/29 dev eth0

# eth1 ↔ Switch2 ↔ Gilgalad & Cirdan
ip addr add 10.75.1.126/25 dev eth1   # gateway Gilgalad
ip addr add 10.75.1.254/27 dev eth1   # gateway Cirdan

# Default route ke Pelargir
ip route add default via 10.75.2.57 dev eth0