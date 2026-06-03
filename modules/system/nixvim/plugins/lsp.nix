{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          lua_ls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          clangd.enable = true;
          bashls.enable = true;
          pyright.enable = true;
          ruff.enable = true;
          yamlls.enable = true;
          marksman.enable = true;
          qmlls = {
            enable = true;
            package = pkgs.qt6.qtdeclarative;
            extraOptions = {
              cmd = [
                "qmlls"
                "-E"
              ];
              capabilities = {
                textDocument = {
                  semanticTokens = null;
                };
              };
            };
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            "gd" = "definition";
            "gD" = "declaration";
            "gr" = "references";
            "gi" = "implementation";
            "gy" = "type_definition";
            "K" = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            "<leader>f" = "format";
            "<leader>D" = "type_definition";
          };
          diagnostic = {
            "<leader>e" = "open_float";
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>q" = "setloclist";
            "<leader>d" = "open_float"; # easier to reach than <leader>e
          };
        };
      };
    };
  };
}
