{
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      # Terminal + code
      nerd-fonts.go-mono

      # Display / UI
      cinzel

      # System fallbacks
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans

      # Nerd Font symbols for icons
      nerd-fonts.symbols-only
      font-awesome
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font"
          "GoMono Nerd Font"
          "Noto Sans Mono"
        ];
        sansSerif = [ "Noto Serif" ];
        # serif = [ "Cinzel" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
