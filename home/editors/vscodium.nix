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
        "terminal.integrated.fontFamily" = "GoMono Nerd Font";
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
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
        "qt-qml.qmlls.customExePath" = "/run/current-system/sw/bin/qmlls";
        "qt-qml.doNotAskForQmllsDownload" = true;
        "qt-core.additionalQtPaths" = [
          {
            "name" = "Qt-6.11.0-linux-g++-x86_64_from_PATH";
            "path" = "/run/current-system/sw/bin/qtpaths";
          }
        ];
        "workbench.editorAssociations" = {
          "{git,gitlens,chat-editing-snapshot-text-model,copilot,git-graph,git-graph-3}:/**/*.qrc" =
            "default";
          "*.qrc" = "qt-core.qrcEditor";
        };
        "nix.serverSettings" = {
          nixd = {
            nixpkgs.expr = "import (builtins.getFlake \"${toString ../..}\").inputs.nixpkgs {}";
            options.nixos.expr = "(builtins.getFlake \"${toString ../..}\").nixosConfigurations.firelink.options";
          };
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixfmt";
        "nix.diagnostics.excludedExitCode" = 0;
        "nix.hiddenLanguageServerErrors" = [
          "textDocument/definition"
        ];

        # default formatter for everything
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;

        # per-language overrides
        "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
        "[lua]"."editor.defaultFormatter" = "JohnnyMorganz.stylua";
        "[css]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[qml]"."editor.defaultFormatter" = "Delgan.qml-format";

        # JSON, YAML, QML
        "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "qt-qml.qmlls.enabled" = true;

        # JavaScript
        "javascript.suggest.autoImports" = true;
        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.suggest.autoImports" = true;
      };

      extensions =
        with pkgs.vscode-extensions;
        [
          jnoortheen.nix-ide
          christian-kohler.path-intellisense
          oderwat.indent-rainbow
          ritwickdey.liveserver
          esbenp.prettier-vscode
          pkief.material-icon-theme
          christian-kohler.npm-intellisense
        ]
        ++ (with pkgs.open-vsx; [
          theqtcompany.qt-qml
          theqtcompany.qt-core
          delgan.qml-format
          johnnymorganz.stylua
        ]);
    };
  };
}
