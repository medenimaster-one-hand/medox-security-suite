#!/bin/bash
echo -e "\n=================================================="
echo -e "       ZAPOČINJEM DEEP SCAN LOGOVA (Forenzika)     "
echo -e "==================================================\n"

REPORT_FILE="/tmp/deep_scan_report_$(date +%F_%H%M%S).txt"
echo "Deep Scan Izveštaj - $(date)" > "$REPORT_FILE"
echo "----------------------------------------" >> "$REPORT_FILE"

echo "[*] Analiza auth logova (Pokušaji neovlašćenog pristupa)..."
echo "--- NEUSPELI LOGIN POKUŠAJI ---" >> "$REPORT_FILE"
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | awk '{print $1,$2,$3,$11}' | sort | uniq -c >> "$REPORT_FILE"
else
    journalctl _SYSTEMD_UNIT=ssh.service | grep "Failed password" >> "$REPORT_FILE"
fi

echo "[*] Skeniranje sistemskih i kernel logova za kritične greške..."
echo -e "\n--- KRITIČNE SISTEMSKE GREŠKE ---" >> "$REPORT_FILE"
dmesg -T | grep -Ei "panic|error|critical|failed" | tail -n 20 >> "$REPORT_FILE"
journalctl -p 0..3 -n 20 --no-pager >> "$REPORT_FILE"

echo -e "\n=================================================="
echo -e "Skener je završio analizu."
echo -e "Kompletan izveštaj je sačuvan na lokaciji: $REPORT_FILE"
echo -e "=================================================="
