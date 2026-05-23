{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "python-lsp"
      "lua"
      "html"
      "qml"
      "astro"
    ];

    userSettings = {
      lsp = {
        nix.binary.path_lookup = true;
        pyright = {
          binary.path_lookup = true;
          settings.python.analysis = {
            typeCheckingMode = "standard";
            autoImportCompletions = true;
          };
        };
        ruff.binary.path_lookup = true;
        vtsls.binary.path_lookup = true;
        vscode-html-language-server.binary.path_lookup = true;
        vscode-css-language-server.binary.path_lookup = true;
        qmlls.binary.path_lookup = true;
      };

      theme = {
        mode = "dark";
        light = "Noctalia";
        dark = "Noctalia";
      };

      icon_theme = {
        mode = "dark";
        light = "Material Icon Theme";
        dark = "Material Icon Theme";
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      session.trust_all_worktrees = true;
      autosave.after_delay.milliseconds = 100;

      buffer_font_family = "GoMono Nerd Font";
      buffer_font_features.calt = true;
      buffer_font_size = 15;
      buffer_font_weight = 400;
      buffer_line_height = "comfortable";
      ui_font_family = "Noto Serif";
      ui_font_size = 16;
      cursor_blink = true;
      cursor_shape = "bar";
      auto_update = false;
      vim_mode = false;
      hour_format = "hour12";
      format_on_save = "off";

      disable_ai = true;

      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter.language_server.name = "nixd";
        };
        Python = {
          language_servers = [
            "pyright"
            "ruff"
          ];
          formatter.language_server.name = "ruff";
          format_on_save = "on"; # override global "off" for Python only
        };
        TypeScript.language_servers = [
          "vtsls"
          "!typescript-language-server"
        ];
        JavaScript.language_servers = [
          "vtsls"
          "!typescript-language-server"
        ];
        HTML.language_servers = [ "vscode-html-language-server" ];
        CSS.language_servers = [ "vscode-css-language-server" ];
        QML.language_servers = [ "qmlls" ];
      };
    };
  };
}
