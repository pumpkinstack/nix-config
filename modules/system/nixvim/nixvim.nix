{
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./settings.nix
    ./plugins/lsp.nix
    ./plugins/cmp.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
