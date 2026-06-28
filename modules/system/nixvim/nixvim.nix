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
    ./plugins/statusline.nix
    ./plugins/autopairs.nix
    ./plugins/lazygit.nix
    ./plugins/harpoon.nix
    ./plugins/indent.nix
    ./plugins/key.nix
    ./plugins/noice.nix
    ./plugins/misc.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/nvim-tree.nix
    ./plugins/bufferline.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
