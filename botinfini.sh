#!/bin/bash
# keepalive.sh - Maintient le codespace actif 24/7

while true; do
    # Activité CPU légère
    echo "$(date): Keepalive ping $(whoami)@$(hostname)" >> /tmp/keepalive.log
    
    # Compilation inutile mais CPU-intensive
    gcc -o /dev/null -c -O3 /dev/null 2>/dev/null || true
    
    # I/O disque minimal
    echo "heartbeat" >> /tmp/heartbeat.log
    
    # Activité réseau (ping GitHub)
    curl -s "https://api.github.com" > /dev/null 2>/dev/null || true
    
    sleep 30  # Toutes les 30s (évite la détection idle)
done
