#!/bin/bash

# Definišemo putanju do fajla gde skripta čuva istoriju akcija
LOG_FILE="$HOME/.whitehat_actions.log"

# FUNKCIJA 1: Beleženje nove akcije u log fajl
zabelezi_akciju() {
    local akcija="$1"    # Npr. "LOCK PORT"
    local detalji="$2"   # Npr. "8080 (Deny)"
    local vreme
    vreme=$(date +"%H:%M:%S") # Formatira vreme kao na tvom panelu

    # Upisujemo u log fajl u formatu: Akcija | Detalji | Vreme
    echo "${akcija}|${detalji}|${vreme}" >> "$LOG_FILE"
}

# FUNKCIJA 2: Iscrtavanje desnog panela na ekranu
prikazi_recent_actions() {
    echo -e "┌────────────────────────────────────────┐"
    echo -e "│ Recent Actions Log                     │"
    echo -e "├────────────────────────────────────────┤"

    # Proveravamo da li log fajl postoji i da li ima zapisa
    if [ -f "$LOG_FILE" ] && [ -s "$LOG_FILE" ]; then
        # Uzimamo poslednje 3 akcije iz fajla i čitamo ih liniju po liniju
        tail -n 3 "$LOG_FILE" | while IFS='|' read -r akcija detalji vreme; do
            echo -e "│ Action:  \e[1;33m$akcija\e[0m"
            echo -e "│ Details: $detalji"
            echo -e "│ Time:    [$vreme]"
            echo -e "├────────────────────────────────────────┤"
        done
    else
        # Ako je log prazan (npr. tek pokrenuta skripta)
        echo -e "│ No recent actions logged yet.          │"
        echo -e "├────────────────────────────────────────┤"
    fi
   
    # Donja statistika panela (fiksni brojevi ili promenljive koje brojiš)
    echo -e "│ Port Closed:  8080                     │"
    echo -e "│ Security Lvl: HIGH                     │"
    echo -e "└────────────────────────────────────────┘"
}
