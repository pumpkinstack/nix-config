{ pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate || loginctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl clients -j | jq -r '.[].pid' | xargs kill; pkill Hyprland || pkill niri || loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "hyprctl clients -j | jq -r '.[].pid' | xargs kill; systemctl poweroff || loginctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend || loginctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "hyprctl clients -j | jq -r '.[].pid' | xargs kill; systemctl reboot || loginctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
      @import "colors.css";
      
      * {
        background-image: none;
        box-shadow: none;
      }
      
      window {
        background-color: rgba(12, 12, 12, 0.9);
      }
      
      button {
        color: @foreground;
        background-color: @background;
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border-radius: 10px;
        margin: 5px;
        transition: all 0.3s ease-in-out;
      }
      
      button:focus, button:active, button:hover {
        background-color: @color4;
        color: @background;
        outline-style: none;
        border-color: @color2;
      }
      
      #lock {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
        border-color: @color3;
      }
      
      #logout {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
        border-color: @color1;
      }
      
      #suspend {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
        border-color: @color4;
      }
      
      #hibernate {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
        border-color: @color5;
      }
      
      #shutdown {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
        border-color: @color1;
      }
      
      #reboot {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
        border-color: @color6;
      }
    '';
  };
}