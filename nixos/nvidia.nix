{ config, pkgs, ... }:
{
  # Enable OpenGl
  hardware.graphics.enable = true;

  # Load nvidia drivers for Xorg and Wayland
  services.xserver.videoDrivers = [
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = true;

    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
