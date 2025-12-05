# BISA nyoba pakai config.sh
cd /root
nano config.sh   # paste isi script di atas, save

chmod +x config.sh
./config.sh


#Set IP statik ke NAT di Osgiliath

#Tempel ini di Osgiliath:

# Nyalakan IP forwarding (sekali lagi tidak apa-apa)
sysctl -w net.ipv4.ip_forward=1

# Bersihkan dulu IP dan default di eth0
ip addr flush dev eth0
ip route del default 2>/dev/null

# Set IP WAN statik menuju NAT1 (COBA PAKAI 192.168.122.0/24)
ip addr add 192.168.122.2/24 dev eth0

# Tambah default route ke NAT gateway
ip route add default via 192.168.122.1 dev eth0

# Cek
echo "=== eth0 sekarang ==="
ip addr show eth0
echo "=== routing table ==="
ip route

#Lalu uji dulu link ke NAT:

ping -c3 192.168.122.1

#Pasang SNAT tanpa MASQUERADE

#di Osgiliath:

# Reset tabel NAT
iptables -t nat -F

# NAT semua jaringan internal 10.75.x.x ke IP WAN 192.168.122.2
iptables -t nat -A POSTROUTING -s 10.75.0.0/16 -o eth0 -j SNAT --to-source 192.168.122.2

# Pastikan paket boleh lewat
iptables -P FORWARD ACCEPT

# Cek aturan NAT
iptables -t nat -L -n -v


# Sekarang uji dari Osgiliath dan semua client

ping -c3 8.8.8.8