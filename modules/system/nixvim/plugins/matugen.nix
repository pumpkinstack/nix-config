{ pkgs, lib, ... }:
let
  matugen-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "matugen.nvim";
    version = "unstable-2026-08-12";
    src = pkgs.fetchFromGitHub {
      owner = "daedlock";
      repo = "matugen.nvim";
      rev = "835a2f4c7b32e5e0fa57f3595a04a638ff74d8bc";
      hash = "sha256-J5bAD07kF1a7BAWzzIGSsQKns4rBWb1tK606Bh0pR00=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [ matugen-nvim ];
    extraPackages = [ pkgs.matugen ];

    extraConfigLua = ''
      require("matugen").setup({
        colors_path = vim.fn.expand("~/.config/matugen/colors.json"),
        watch = true,

        -- Same knobs as the README defaults - tweak to taste.
        brightness = 0.03,
        contrast = 0,
        sidebar_brightness = 0.02,
        harmonize = 15,
        min_contrast = 0.45,
      })

      vim.cmd.colorscheme("matugen")

      -- Keep lualine in sync on every wallpaper-driven reload.
      vim.api.nvim_create_autocmd("User", {
        pattern = "MatugenReloaded",
        callback = function()
          local ok, lualine = pcall(require, "lualine")
          if ok then
            lualine.setup({ options = { theme = require("matugen").lualine() } })
          end
        end,
      })
    '';
  };
}
