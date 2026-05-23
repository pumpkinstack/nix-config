{ ... }:

{
  imports = [
    ./binds.nix
    ./autospawn.nix
  ];

  programs.niri.settings = {
    input = {
      mod-key = "Super";
      mod-key-nested = "Alt";
      keyboard.xkb.layout = "us";
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
    };
    outputs."eDP-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 144.0;
      };
      scale = 1.0;
    };
  };
}
