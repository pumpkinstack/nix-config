# nixos-config

My personal NixOS configuration using flakes and Home Manager.

## System

| | |
|---|---|
| **Host** | leyndell |
| **WM** | Hyprland |
| **Shell** | Nix shell (home-manager) |
| **GPU** | NVIDIA |
| **Display** | Wayland |

## Stack

- **Terminal** — Kitty
- **Editor** — VSCodium + NixVim
- **Browser** — Zen
- **Launcher** — Rofi
- **Notifications** — SwayNC
- **Theming** — Matugen + Wallust (material you / wallpaper-based colors)
- **Wallpaper** — mpvpaper + wallpaper changer script
- **Logout** — wlogout

## Structure

```
.
├── flake.nix          # Entrypoint
├── home/              # Home Manager modules
│   ├── hyprland/      # Hyprland config (binds, animations, rules, etc.)
│   ├── quickshell/    # Bar and widgets (QML)
│   ├── matugen/       # Color templates for all apps
│   ├── wallust/       # Wallpaper-based color templates
│   └── ...
├── hosts/
│   └── leyndell/      # Host-specific config + hardware
└── modules/
    └── system/        # System-level NixOS modules
        └── nixvim/    # Neovim config via nixvim
```

## Note

> This config is tailored to my specific hardware and setup. Don't blindly apply it —
> at minimum you'll need to replace `hosts/leyndell/hardware-configuration.nix` with
> your own (generated via `nixos-generate-config`).
