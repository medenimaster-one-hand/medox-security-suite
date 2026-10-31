#!/bin/bash

echo "========================================================"
echo "               HUNTER ROOTKIT SCANNER                  "
echo "========================================================"

# Automatska instalacija chkrootkit-a ako nedostaje
if ! command -v chkrootkit &> /dev/null; then
    echo "[!] chkrootkit nije instaliran. Instalacija u toku..."
    sudo apt-get update -y && sudo apt-get install chkrootkit -y
fi

echo ""
echo "[+] Pokrećem duboko skeniranje sistema na rootkitove..."
echo "Molimo sačekajte, ovo može potrajati minut-dva..."
echo ""

# Pokretanje skeniranja i prikazivanje rezulta
sudo chkrootkit | sed 's/INFECTED/\x07INFECTED/g'

echo ""
