#!/usr/bin/env bash

config=$(ls ./NixOs/ | fzf)

sudo cp "./NixOs/$config" "/etc/nixos/configuration.nix"
nixos-rebuild switch
