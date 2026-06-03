{ pkgs, ... }:
{
  programs.nixvim = {
    clipboard = {
      providers.wl-copy.enable = pkgs.stdenv.isLinux;
    };
    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      smartindent = true;
      breakindent = true;
      cursorline = true;
      mouse = "a";
      linebreak = true;
      spell = false;
      swapfile = false;
      termguicolors = true;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      cmdheight = 0;
      undofile = true;
      scrolloff = 8; # keep context lines above/below cursor
      signcolumn = "yes"; # prevent layout shift when signs appear (LSP, git)
      updatetime = 250; # faster CursorHold (good for LSP hover)
      timeoutlen = 300; # snappier which-key / keybind feel
      ignorecase = true; # case-insensitive search...
      smartcase = true; # ...unless you type a capital
      hlsearch = false; # don't leave search highlights after moving
    };
    extraConfigLua = ''
      local function load_matugen()
        pcall(dofile, vim.fn.expand("~/.local/share/nvim/site/lua/matugen_colors.lua"))
      end

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = load_matugen,
      })

      vim.api.nvim_create_autocmd("Signal", {
        pattern = "SIGUSR1",
        callback = load_matugen,
      })
    '';
  };
}
