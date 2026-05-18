{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/users.nix
    ../../modules/system/boot.nix
    ../../modules/system/desktop.nix
    ../../modules/system/sddm.nix
    ../../modules/system/gaming.nix
    ../../modules/system/locale.nix
    ../../modules/system/networking.nix
    ../../modules/system/packages.nix
    ../../modules/system/services.nix
    ../../modules/system/audio.nix
    ../../modules/system/fonts.nix
    ../../modules/system/nixvim/nixvim.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  system.stateVersion = "25.11";
}
