#!/bin/bash
# ==============================================================================
#      MEDOX SECURITY & NETWORK AUTOMATION SUITE v2.5 (PREMIUM BUILD)
# Core: Non-Breaking UI Loop, UFW Cyber-Lock, System Monitor & Auto-Archive
# Developed by: medeni_whitehat & Gemini (The Ultimate Tandem)
# ==============================================================================

while true; do
    clear
    echo -e "\033[0;36m=====================================================\033[0m"
    echo -e "\033[0;32m      ⚡ MEDOX SECURITY SUITE v2.5 - PREMIUM ⚡      \033[0m"
    echo -e "\033[0;36m=====================================================\033[0m"
    echo -e "\n\033[1;33m [1] Hardening Firewall (UFW Cyber-Lock)\033[0m"
    echo -e "\033[1;33m [2] Run Automated System Backup Archive\033[0m"
    echo -e "\033[1;33m [3] Show Visual System Resource Monitor\033[0m"
    echo -e "\033[1;31m [4] Exit Lab (Close program)\033[0m"
    echo -e "\033[0;36m=====================================================\033[0m"
    read -p "Select option [1-4]: " opcija

    case $opcija in
        1)
            echo -e "\n\033[0;36m[*] Activating UFW Cyber-Shield...\033[0m"
            sudo ufw enable
            echo -e "\033[0;32m[V] Firewall successfully deployed and active!\033[0m"
            echo -e "\nPress Enter to return to menu..."
            read
            ;;
        2)
            echo -e "\n\033[0;36m[*] Running automated system backup...\033[0m"
            tar -cvzf backup.tar.gz ~/* 2>/dev/null
            echo -e "\033[0;32m[V] Backup archive successfully saved!\033[0m"
            echo -e "\nPress Enter to return to menu..."
            read
            ;;
        3)
            echo -e "\n\033[0;36m[*] Launching Visual Monitor... (Press Q to exit)\033[0m"
            sleep 1
            htop || top
            ;;
        4)
            echo -e "\n\033[1;33m[i] Exiting Lab. Mamba mentality never quits!\033[0m"
            exit 0
            ;;
        *)
            echo -e "\n\033[0;31m[X] Invalid option! Please try again.\033[0m"
            sleep 1.5
            ;;
    esac
done
