{ config, pkgs, ... }:
{

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim # editor
    gcc
    rustup
    git
    ripgrep
    fd
    fzf
    unzip
    wget
    nodejs_24
    wayland-utils
    wl-clipboard
    kdePackages.sddm-kcm # Configuration module for SDDM
    direnv
    nix-direnv
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    nh = {
      enable = true;
      clean = {
      enable = true;
      extraArgs = "--keep 3 --keep-since 3d";
      }
    };
  };
}
