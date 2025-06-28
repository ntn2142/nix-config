#!/usr/bin/env bash

# TODO: falls ./home-manager/$(whoami)_on_$(hostname).nix nicht existiert verwende ./home-manager/$(whoami).nix

set -euo pipefail

# Benutzer- und Hostname-basiert
user_host_config="./home-manager/$(whoami)_on_$(hostname).nix"
user_config="./home-manager/$(whoami).nix"

# Prüfe, ob die Datei existiert
if [[ -f "$user_host_config" ]]; then
    echo "Verwende Host-spezifische Konfiguration: $user_host_config"
    home-manager switch --file "$user_host_config"
elif [[ -f "$user_config" ]]; then
    echo "Verwende allgemeine Konfiguration: $user_config"
    home-manager switch --file "$user_config"
else
    echo "Fehler: Keine passende Konfigurationsdatei für Benutzer '$(whoami)' auf Host '$(hostname)' gefunden." >&2
    exit 1
fi
