{ ... }:
{
  hardware.nvidia.prime = {
    # Make sure to use the correct Bus ID values for your system!
    # $ nix shell nixpkgs#lshw --command sudo lshw -c display
    # convert hex to decimal and remove leading zeroes
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:2:0:0";
    # amdgpuBusId = "PCI:54:0:0"; For AMD GPU

    sync.enable = true;
  };
}
