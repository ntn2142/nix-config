#!/usr/bin/env bash

set -euo pipefail

# Dateiname basierend auf Hostname
host_config="./nixos/$(hostname).nix"

# Prüfe, ob passende Datei existiert
if [[ -f "$host_config" ]]; then
    echo "Verwende Konfiguration: $host_config"
    sudo cp "$host_config" /etc/nixos/configuration.nix
    sudo nixos-rebuild switch
else
    echo "Fehler: Keine passende Konfigurationsdatei für Hostname '$(hostname)' gefunden" >&2
    exit 1
fi
