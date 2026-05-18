{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/locale.nix
    ../../modules/system/packages.nix
    ../../modules/system/desktop.nix
    # ../../modules/system/browser.nix
    ../../modules/system/sddm.nix
    ../../modules/system/audio.nix
    ../../modules/system/fonts.nix
    ../../modules/system/services.nix
    ../../modules/system/gaming.nix
    ../../modules/system/nixvim/nixvim.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      # "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  users.users.tarnished = {
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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  sops.age.keyFile = "/home/tarnished/.config/sops/age/keys.txt";
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  system.stateVersion = "25.11";
}
