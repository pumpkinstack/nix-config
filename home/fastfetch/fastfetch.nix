{ pkgs, ... }:

{
  home.packages = [ pkgs.fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".source = pkgs.writeText "fastfetch-config.jsonc" ''
    {
      "$schema": "https://github.com/LinusDierheimer/fastfetch/raw/master/doc/json_schema.json",
      "logo": {
        "source": "`find $HOME/Pictures/icons -type f | shuf -n 1`",
        "type": "kitty",
        "width": 40,
        "padding": {
          "top": 1,
          "left": 1,
          "right": 2
        }
      },
      "display": {
        "separator": "  "
      },
      "modules": [
        {
          "type": "title",
          "format": "{#1}╭───────────── {#}{user-name-colored}"
        },
        {
          "type": "custom",
          "format": "{#1}│ {#}System Information"
        },
        {
          "type": "os",
          "key": "{#separator}│  {#keys}󰍹 OS"
        },
        {
          "type": "kernel",
          "key": "{#separator}│  {#keys}󰒋 Kernel"
        },
        {
          "type": "uptime",
          "key": "{#separator}│  {#keys}󰅐 Uptime"
        },
        {
          "type": "custom",
          "format": "{#1}│"
        },
        {
          "type": "custom",
          "format": "{#1}│ {#}Desktop Environment"
        },
        {
          "type": "de",
          "key": "{#separator}│  {#keys}󰧨 DE"
        },
        {
          "type": "wm",
          "key": "{#separator}│  {#keys}󱂬 WM"
        },
        {
          "type": "Font",
          "key": "{#separator}│  {#keys} Font"
        },
        {
          "type": "theme",
          "key": "{#separator}│  {#keys}󰉼 Theme"
        },
        {
          "type": "Icons",
          "key": "{#separator}|  {#keys} Icons"
        },
        {
          "type": "display",
          "key": "{#separator}│  {#keys}󰹑 Resolution"
        },
        {
          "type": "shell",
          "key": "{#separator}│  {#keys}󰞷 Shell"
        },
        {
          "type": "terminalfont",
          "key": "{#separator}│  {#keys}󰛖 Font"
        },
        {
          "type": "terminal",
          "key": "{#separator}|  {#keys} Terminal"
        },
        {
          "type": "packages",
          "key": "{#separator}|  {#keys}󰏖 Packages"
        },
        {
          "type": "custom",
          "format": "{#1}│"
        },
        {
          "type": "custom",
          "format": "{#1}│ {#}Hardware Information"
        },
        {
          "type": "cpu",
          "key": "{#separator}│  {#keys}󰻠 CPU"
        },
        {
          "type": "gpu",
          "key": "{#separator}│  {#keys}󰢮 GPU"
        },
        {
          "type": "memory",
          "key": "{#separator}│  {#keys}󰍛 Memory"
        },
        {
          "type": "disk",
          "key": "{#separator}│  {#keys}󰋊 Disk (/)",
          "folders": "/"
        },
        {
          "type": "swap",
          "key": "{#separator}│  {#keys}󰋊 Swap"
        },
        {
          "type": "custom",
          "format": "{#1}│"
        },
        {
          "type": "colors",
          "key": "{#separator}│ {#keys}",
          "symbol": "circle"
        },
        {
          "type": "custom",
          "format": "{#1}╰───────────────────────────────╯"
        }
      ]
    }
  '';
}