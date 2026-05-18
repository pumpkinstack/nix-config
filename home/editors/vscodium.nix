{
  pkgs,
  ...
}:
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "NoctaliaTheme";
        "workbench.iconTheme" = "material-icon-theme";
        "editor.fontFamily" = "'Noto Serif', 'GoMono Nerd Font'";
        "editor.fontSize" = 14;
        "editor.fontLigatures" = true;
        "editor.lineHeight" = 1.5;
        "editor.tabSize" = 2;
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 100;
        "workbench.startupEditor" = "none";
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "redhat.telemetry.enabled" = false;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixfmt";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
            "options" = {
              "nixos" = {
                "expr" =
                  "(builtins.getFlake \"/home/tarnished/path-to-your-config\").nixosConfigurations.leyndell.options";
              };
              "home-manager" = {
                "expr" =
                  "(builtins.getFlake \"/home/tarnished/path-to-your-config\").homeConfigurations.\"tarnished@leyndell\".options";
              };
            };
          };
        };

        # default formatter for everything
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;

        # per-language overrides
        "[nix]"."editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
        "[python]"."editor.defaultFormatter" = "ms-python.python";
        "[rust]"."editor.defaultFormatter" = "rust-lang.rust-analyzer";
        "[lua]"."editor.defaultFormatter" = "JohnnyMorganz.stylua";
        "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

        # New additions for JSON, YAML, and QML
        "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[yaml]"."editor.defaultFormatter" = "redhat.vscode-yaml";
      };

      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        christian-kohler.path-intellisense
        oderwat.indent-rainbow
        ritwickdey.liveserver
        brettm12345.nixfmt-vscode
        esbenp.prettier-vscode
        pkief.material-icon-theme
      ];
    };
  };
}
