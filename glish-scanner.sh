#!/bin/bash

    dialog --msgbox " |***| Glish_ScanneR_tool |***| " 6 40
# Vérifie que les outils nécessaires sont installés
for cmd in dialog xterm nmap dmitry nc masscan hping3 unicornscan zmap; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Please install $cmd."
        exit 1
    fi
done

# Demande l'adresse IP
IP=$(dialog --title "Port Scanner" --inputbox "Enter the target IP address:" 8 50 2>&1 >/dev/tty)

# Vérifie que l'IP a été saisie
if [ -z "$IP" ]; then
    dialog --msgbox "No IP address entered. Exiting." 6 40
    exit 1
fi

# Choisir les outils à utiliser avec dialog
TOOLS=$(dialog --title "Select Tools" --checklist "Choose tools to run:" 15 60 7 \
    1 "Nmap" off \
    2 "Dmitry" off \
    3 "Netcat" off \
    4 "Masscan" off \
    5 "Hping3" off \
    6 "Unicornscan" off \
    7 "ZMap" off 2>&1 >/dev/tty)

# Si aucun outil n'est sélectionné, quitter
if [ -z "$TOOLS" ]; then
    dialog --msgbox "No tools selected. Exiting." 6 40
    exit 1
fi

# Lancer les outils sélectionnés dans des fenêtres xterm et enregistrer les résultats dans des fichiers à la racine
for TOOL in $TOOLS; do
    case $TOOL in
        1) 
            LOG_FILE="nmap_${IP}.log"
            xterm -T "Nmap Scan" -e bash -c "echo 'Running Nmap...'; nmap '$IP' > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        2) 
            LOG_FILE="dmitry_${IP}.log"
            xterm -T "Dmitry Scan" -e bash -c "echo 'Running Dmitry...'; dmitry -p '$IP' > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        3) 
            LOG_FILE="netcat_${IP}.log"
            xterm -T "Netcat Scan" -e bash -c "echo 'Running Netcat...'; nc -zv '$IP' 1-1000 > '$LOG_FILE' 2>&1; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        4) 
            LOG_FILE="masscan_${IP}.log"
            xterm -T "Masscan Scan" -e bash -c "echo 'Running Masscan...'; sudo masscan '$IP' -p1-1024 --rate=1000 > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        5) 
            LOG_FILE="hping3_${IP}.log"
            xterm -T "Hping3 Scan" -e bash -c "echo 'Running Hping3...'; sudo hping3 -S '$IP' -p 80 -c 1 > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        6) 
            LOG_FILE="unicornscan_${IP}.log"
            xterm -T "Unicornscan Scan" -e bash -c "echo 'Running Unicornscan...'; sudo unicornscan -Iv '$IP':1-1000 > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
        7) 
            LOG_FILE="zmap_${IP}.log"
            xterm -T "ZMap Scan" -e bash -c "echo 'Running ZMap...'; sudo zmap -p 80 '$IP' > '$LOG_FILE'; echo 'Results saved to $LOG_FILE'; read -p 'Press enter to close...'" &
            ;;
    esac
done

# Message final
dialog --msgbox "Scans are running in xterm.\nResults are saved in files like nmap_${IP}.log in the current directory." 10 50
clear
