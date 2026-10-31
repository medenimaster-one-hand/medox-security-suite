#!/bin/bash

# Root privileges check
if [ "$EUID" -ne 0 ]; then
    echo -e "\e[31m[-] Error: This toolkit must be executed with sudo privileges!\e[0m"
    echo "Please relaunch using: sudo ./main.sh"
    exit 1
fi

pokreni_shield() {
    if [ -f "./whitehat_shield.sh" ]; then
        chmod +x whitehat_shield.sh
        sudo ./whitehat_shield.sh
    else
        echo -e "\n\e[31mError: File whitehat_shield.sh not found!\e[0m"
    fi
    read -p "Press [Enter] to return to main menu..."
}

pokreni_hunter() {
    if [ -f "./whitehat_hunter.sh" ]; then
        chmod +x whitehat_hunter.sh
        sudo ./whitehat_hunter.sh
    else
        echo -e "\n\e[31mError: File whitehat_hunter.sh not found!\e[0m"
    fi
    read -p "Press [Enter] to return to main menu..."
}

pokreni_white_scout() {
    if [ -f "./radar.sh" ]; then
        chmod +x radar.sh
        sudo ./radar.sh
    else
        echo -e "\n\e[31mError: File radar.sh not found!\e[0m"
    fi
    read -p "Press [Enter] to return to main menu..."
}

pokreni_audit() {
    if [ -f "./radar_audit.sh" ]; then
        chmod +x radar_audit.sh
        sudo ./radar_audit.sh
    else
        echo -e "\n\e[31mError: File radar_audit.sh not found!\e[0m"
    fi
    read -p "Press [Enter] to return to main menu..."
}

show_menu() {
    clear
    echo -e "\e[36m========================================================\e[0m"
    echo -e "\e[1;32m         LINUX SECURITY & AUDIT TOOLKIT v1.0\e[0m"
    echo -e "\e[36m========================================================\e[0m"
    echo -e "1) \e[33mSHIELD\e[0m       - Defensive Netfilter Firewall (UFW & iptables)"
    echo -e "2) \e[33mHUNTER\e[0m       - Malware & Active Rootkit Scanner"
    echo -e "3) \e[33mWHITE SCOUT\e[0m  - Network Reconnaissance & Port Audit"
    echo -e "4) \e[33mAUDIT\e[0m        - System Hardware Blueprint & Resource Diagnostics"
    echo -e "5) Exit Subsystem"
    echo -e "\e[36m========================================================\e[0m"
}

while true; do
    show_menu
    read -p "Select a module (1-5): " option
    case $option in
        1) pokreni_shield ;;
        2) pokreni_hunter ;;
        3) pokreni_white_scout ;;
        4) pokreni_audit ;;
        5) echo -e "\nTerminating system toolkit. Stay safe!"; exit 0 ;;
        *) echo -e "\n\e[31mInvalid option!\e[0m Please select between 1 and 5."; sleep 2 ;;
    esac
done
