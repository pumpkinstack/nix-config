{ pkgs, ... }:
{
    users.users.ashenone = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };
}
