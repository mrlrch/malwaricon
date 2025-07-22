#!/bin/bash
# malwaricon.sh - reconnaissance automation script

DOMAIN=$1
MODE=$2

if [ -z "$DOMAIN" ]; then
    echo "Usage: $0 <domain> [mode]"
    exit 1
fi

echo "[*] Starting reconnaissance for $DOMAIN"

if [ "$MODE" == "nmap-only" ] || [ -z "$MODE" ]; then
    echo "[*] Running Nmap..."
    nmap -sV -oN "$DOMAIN"_nmap.txt $DOMAIN
fi

if [ "$MODE" == "crt-only" ] || [ -z "$MODE" ]; then
    echo "[*] Enumerating subdomains from crt.sh..."
    curl -s "https://crt.sh/?q=%25.$DOMAIN&output=json" | jq -r '.[].name_value' | sort -u > "$DOMAIN"_crt.txt
fi

if [ "$MODE" == "dirsearch-only" ] || [ -z "$MODE" ]; then
    echo "[*] Running Dirsearch..."
    python3 dirsearch.py -u "https://$DOMAIN" -e php,html,js,txt -o "$DOMAIN"_dirsearch.txt
fi

echo "[*] Recon completed for $DOMAIN"
