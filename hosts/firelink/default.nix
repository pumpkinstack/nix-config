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
    ../../modules/system/multimedia.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org"
      "https://quickshell.cachix.org"
      "https://nix-community.cachix.org"
      "https://freesmlauncher.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "quickshell.cachix.org-1:yFoCP7+7YDLB6YUSTjvdL5Wa0RPpzFqrklyKTmWp9Gk="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "freesmlauncher.cachix.org-1:Jcp5Q9wiLL+EDv8Mh7c6L9xGk+lXr7/otpKxMOuBuDs="
    ];
  };

  nix.settings.accept-flake-config = false;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    MOZ_ENABLE_WAYLAND = "1";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  system.stateVersion = "25.11";
}
