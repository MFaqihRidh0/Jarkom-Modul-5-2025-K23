# 2. Konfigurasi per client
2.1 Elendil

Subnet: 10.75.0.0/24 – gateway Minastir 10.75.0.254

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.0.10/24 dev eth0
ip route add default via 10.75.0.254

# 2.2 Isildur

Subnet: 10.75.1.192/27 – gateway Minastir 10.75.1.222

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.1.194/27 dev eth0
ip route add default via 10.75.1.222

# 2.3 Durin

Subnet: 10.75.1.128/26 – gateway Wilderland 10.75.1.190

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.1.130/26 dev eth0
ip route add default via 10.75.1.190

# 2.4 Khamul

Subnet: 10.75.2.0/29 – gateway Wilderland 10.75.2.6

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.2.2/29 dev eth0
ip route add default via 10.75.2.6

# 2.5 Gilgalad

Subnet: 10.75.1.0/25 – gateway AnduinBanks 10.75.1.126

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.1.10/25 dev eth0
ip route add default via 10.75.1.126

# 2.6 Cirdan

Subnet: 10.75.1.224/27 – gateway AnduinBanks 10.75.1.254

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.1.226/27 dev eth0
ip route add default via 10.75.1.254

# 2.7 IronHills

Subnet: 10.75.3.0/29 – gateway Meria 10.75.3.6

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.3.1/29 dev eth0
ip route add default via 10.75.3.6

# 2.8 Palantir

Subnet: 10.75.3.16/29 – gateway Pelargir 10.75.3.22

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.3.17/29 dev eth0
ip route add default via 10.75.3.22

# 2.9 VRxy (Vilya – DHCP server)

Subnet: 10.75.3.8/29 – gateway Rivendell 10.75.3.14

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.3.9/29 dev eth0
ip route add default via 10.75.3.14

# 2.10 Narya (DNS server)

Subnet: 10.75.3.8/29 – gateway Rivendell 10.75.3.14

#!/bin/bash
ip addr flush dev eth0 2>/dev/null
ip route flush table main

ip addr add 10.75.3.10/29 dev eth0
ip route add default via 10.75.3.14