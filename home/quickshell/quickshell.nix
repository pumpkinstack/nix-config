{ ... }:
{
  home.file.".config/quickshell" = {
    source = ./config;
    recursive = true;
  };
}