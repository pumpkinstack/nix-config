{ inputs, pkgs, ... }:
let
  system = pkgs.system;
  quickshellPkg = inputs.quickshell.packages.${system}.default;
in
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
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
          nixd = {
            enable = true;
            settings = {
              nixpkgs = {
                expr = "import (builtins.getFlake \"${toString ../..}\").inputs.nixpkgs {}";
              };
              options = {
                nixos = {
                  expr = "(builtins.getFlake \"${toString ../..}\").nixosConfigurations.firelink.options";
                };
                home_manager = {
                  expr = "(builtins.getFlake \"${toString ../..}\").nixosConfigurations.firelink.options.home-manager.users.ashenone";
                };
              };
            };
          };
          qmlls = {
            enable = true;
            package = pkgs.qt6.qtdeclarative;
            extraOptions = {
              cmd = [
                "qmlls"
                "-E"
                "-I"
                "${pkgs.qt6.qtdeclarative}/lib/qt-6/qml"
                "-I"
                "${quickshellPkg}/lib/qt-6/qml"
              ];
              on_attach = {
                __raw = ''
                  function(client, bufnr)
                    client.server_capabilities.semanticTokensProvider = nil
                  end
                '';
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
            "gy" = "type_definition"; # go to type
            "K" = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
            # <leader>f is reserved for the Files group; format lives at <C-S-i> (conform)
          };
          diagnostic = {
            "<leader>de" = "open_float"; # was <leader>e (conflicts with NvimTree) and <leader>d (conflicts with which-key group)
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>dq" = "setloclist"; # was <leader>q (too generic)
          };
        };
      };

      # LSP progress notifications in the bottom-right corner
      fidget = {
        enable = true;
        settings.progress.display.done_icon = "✓";
      };

      # Highlight other uses of the word under cursor
      illuminate.enable = true;
    };
  };
}
