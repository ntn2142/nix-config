{ ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ntn2142 = {
    isNormalUser = true;
    description = "ntn2142";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
