{ ... }:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback"; # replaces deprecated lsp_fallback = true
        };
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          python = [ "ruff_format" ];
          javascript = [ "prettier" ];
          javascriptreact = [ "prettier" ];
          typescript = [ "prettier" ];
          typescriptreact = [ "prettier" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          json = [ "prettier" ];
          yaml = [ "prettier" ];
          markdown = [ "prettier" ];
          sh = [ "shfmt" ];
          c = [ "clang_format" ];
          cpp = [ "clang_format" ];
        };
      };
    };

    keymaps = [
      {
        mode = [
          "n"
          "v"
          "i"
        ];
        key = "<C-S-i>";
        action.__raw = ''
          function()
            require("conform").format({ async = true, lsp_format = "fallback" })
          end
        '';
        options = {
          silent = true;
          desc = "Format buffer (conform)";
        };
      }
    ];
  };
}
