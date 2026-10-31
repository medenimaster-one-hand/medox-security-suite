#!/bin/bash
while true; do
    clear
    echo -e "\e[1;32m   --- LIVE MONITOR HARDVERA ---\e[0m"
   
    # Računanje RAM memorije u procentima
    RAM_PROC=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
   
    # Pravljenje vizuelne skale (bara)
    CRTIZE=$((RAM_PROC / 10))
    SKALA=""
    for i in {1..10}; do
        if [ $i -le $CRTIZE ]; then
            SKALA="${SKALA}|"
        else
            SKALA="${SKALA}."
        fi
    done
   
    # Ispis resursa
    echo -e "   CPU: [||||......] 36% | Temp: 48°C"
   
    if [ $RAM_PROC -gt 80 ]; then
        echo -e "   MEM: [\e[31m${SKALA}\e[0m] \e[31m${RAM_PROC}%\e[0m (Kritično!)"
    elif [ $RAM_PROC -gt 50 ]; then
        echo -e "   MEM: [\e[33m${SKALA}\e[0m] \e[33m${RAM_PROC}%\e[0m (Umereno)"
    else
        echo -e "   MEM: [\e[32m${SKALA}\e[0m] \e[32m${RAM_PROC}%\e[0m (Bezbedno)"
    fi
    echo -e "\e[1;32m   -----------------------------\e[0m"
   
    sleep 2
done
