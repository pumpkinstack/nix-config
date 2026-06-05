{ inputs, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
    ./plugins.nix
  ];
  programs.nixcord = {
    enable = true;

    discord.vencord.enable = false;
    discord.equicord.enable = true;

    discord.enable = true;
    vesktop.enable = false;
    discord.commandLineArgs = [
      "--enable-features=VaapiVideoDecoder,MiddleClickAutoscroll"
      "--ozone-platform-hint=auto"
      "--enable-wayland-ime" # useful since you're on NixOS/Wayland likely
    ];

    discord.settings = {
      SKIP_HOST_UPDATE = true;
    };

    # Theming
    config = {
      useQuickCss = true;
      enabledThemes = [ "discord-material.css" ];
      frameless = true;
      transparent = false;
      disableMinSize = true;
    };
  };
}
