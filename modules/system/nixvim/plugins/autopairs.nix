{ ... }:
{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
    settings.check_ts = true; # use treesitter to avoid pairing in comments/strings
  };
}