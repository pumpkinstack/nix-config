{
  ...
}:
{
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.blueman.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  programs.zsh.enable = true;
  services.asusd.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
