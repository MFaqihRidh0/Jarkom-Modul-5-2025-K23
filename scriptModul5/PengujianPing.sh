echo "=== Uji ping dari $(hostname) ==="

for entry in \
  "10.75.1.126 GW_Gilgalad" \
  "10.75.0.10  Elendil" \
  "10.75.1.130 Durin" \
  "10.75.2.2   Khamul" \
  "10.75.1.194 Isildur" \
  "10.75.1.226 Cirdan" \
  "10.75.3.1   IronHills" \
  "10.75.3.17  Palantir" \
  "10.75.3.9   Vilya" \
  "10.75.3.10  Narya"
do
  ip=${entry%% *}
  name=${entry#* }
  echo "---- $name ($ip) ----"
  ping -c2 "$ip" >/dev/null && echo "OK" || echo "FAIL"
done
