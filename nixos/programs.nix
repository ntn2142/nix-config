{ pkgs, pkgs-unstable, ... }:
{

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    nh
    pkgs-unstable.neovim # editor
    git
    ripgrep
    fd
    fzf
    kdePackages.sddm-kcm # Configuration module for SDDM
    wl-clipboard
  ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
