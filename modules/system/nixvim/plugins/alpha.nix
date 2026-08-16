{ ... }:
{
  programs.nixvim = {
    # auto-session: persist and restore editor sessions automatically
    plugins.auto-session = {
      enable = true;
      settings = {
        auto_restore_enabled = false; # only restore when explicitly triggered
        auto_save_enabled = true;
        suppressed_dirs = [
          "~/"
          "~/Downloads"
          "/tmp"
        ];
      };
    };

    plugins.alpha = {
      enable = true;
      settings.layout = [
        {
          type = "padding";
          val = 1;
        }
        {
          type = "text";
          val = [
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⠿⠛⠛⢉⠈⠀⠀⠀⠈⠉⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢸⣿⣿⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠈⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠐⠀⠀⠄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢨⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠈⡀⠀⠀⠈⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⠛⠛⠋⡉⠛⠿⣿⠟⠀⠈⠀⠀⠂⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⡏⠠⠀⣬⡀⣀⠀⠀⠀⠈⠀⠀⢀⠀⠀⠀⠀⢀⠀⠀⢸⠀⠀⠀⠀⣧⠀⠀⠀⠀⢳⡄⠀⠀⠄⠀⠄⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⡀⢠⠙⣛⣨⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢸⠀⠀⠀⠀⣿⠀⠀⠀⡀⠈⡷⡄⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣄⠐⠀⠒⠄⠑⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢸⠀⠀⠀⠀⣴⡆⠀⠀⢀⠀⣷⣄⠀⠀⠈⠀⠀⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⢸⣀⣀⣀⣰⣿⣇⣤⣤⣼⣶⣿⣿⣄⠀⡀⡴⠲⡢⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⠁⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠈⠃⠴⣾⣿⣿⣿⣿⠟⣋⡯⠭⠍⠻⡍⢻⣿⡆⢐⡀⡰⠂⡆⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠈⠀⠀⠀⠀⠀⠀⠀⢧⣠⣴⣶⣾⣿⣷⣾⣿⣿⣿⣷⡊⠁⢀⣠⣤⣶⣶⣾⣿⠃⢼⠅⣒⣠⠇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠈⠀⠀⠀⠘⠐⢀⢺⡿⢛⠽⠋⠒⠲⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡆⢾⠿⢋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠋⠀⠀⠀⠀⠀⠀⠀⢸⠆⠠⠁⠀⣤⣴⣶⣿⣿⠟⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠅⣰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⠀⠀⠀⠀⠀⠀⠀⡄⢚⠂⢻⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠠⠀⢀⣿⣌⢈⠀⢻⣿⣿⣿⣿⣿⣟⠛⠛⠉⢠⣾⣿⣿⣿⣿⡟⣣⣾⠔⢛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⠀⠀⠀⠀⡄⠀⢸⣿⣿⣶⠀⠠⠙⢿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⠿⣋⡾⢟⠡⠊⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠠⠀⠈⢠⠁⢀⣿⣿⣿⣿⠀⣿⣿⣶⣌⡛⠿⣿⣿⣿⣿⣿⡿⢟⡡⢞⠋⡰⠔⠀⠈⠀⠀⢍⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠈⠀⢸⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣷⣶⣮⡍⠉⠁⢠⠁⠀⠂⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠠⠁⣂⠀⠀⠀⠀⠀⠀⠡⢶⣟⣶⣬⡙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀⠘⠀⢠⣾⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⡿⠁⣶⣾⡀⠀⠀⠑⠸⠀⣠⠔⠠⣀⠨⢙⡆⢿⣿⣾⣿⣷⣄⠻⢿⣿⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣌⢿⠟⣋⡴⢸⣿⣿⣿⣷⣦⣤⡥⠁⣭⠰⠆⠙⠈⠀⡐⢶⣦⣭⣭⣙⡛⠿⣦⡙⣿⣿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠈⠀⢻⣿⣿⣿⣿⣿⣿⣿⡿⠃⠺⣿⣤⣽⣿⣿⣿⡿⢟⣩⣶⣿⠆⡉⠐⠠⠐⢡⢼⣦⡻⣿⣿⣿⣿⣿⣶⣧⡌⢿⣿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠠⠈⢿⣿⣿⣿⣿⣿⡟⢰⣿⣷⣬⣛⡛⢛⣋⣥⣶⣿⠿⣋⣵⡟⣱⠃⡇⣿⢸⢘⣿⣷⡌⢿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⢳⣄⠙⠻⠿⢟⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⠿⣋⣵⣾⣿⠟⣴⡏⡆⡇⣿⠌⡆⣿⣿⣿⣆⠻⣿⣿⣿⣿⣿⣿⡌⢿⣿"
            "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠈⢻⣿⣶⣾⣿⢃⣾⣿⣿⣿⣿⡿⠿⣋⣴⣾⣿⣿⡿⢃⣾⡟⠀⠁⡇⢹⡃⡇⡙⢿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⡈⣿"
            "⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⡀⠉⠛⠿⢋⢼⣿⡟⠛⢛⣣⠶⢿⣿⣿⣿⡿⠟⣡⣿⠟⠀⠀⠀⡟⢸⣥⢁⣿⣎⡻⠿⠿⢧⣿⣿⣿⣿⣿⣿⣧⠘"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⢀⡦⢦⡀⠀⢹⠄⠀⣠⠤⠀⠢⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠤⠆⠦⠄⠖⠒⣆⠀⠀⠀⠀⠀⠀⠀⠀⡀⣠⣀⣀⠀⠀⠀⢠⠟⠊⡉⠉⠓⣄⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠫⣀⡬⠹⡆⣘⢣⠚⠀⠀⠀⡀⠀⠉⢦⡀⠀⠀⣀⡀⠀⠨⡅⠀⠀⠀⠀⠀⢘⠂⠀⠀⠀⠀⠀⢐⣞⠛⠉⠀⠉⠛⣰⡀⡏⠀⢼⠁⠀⢀⣭⠁⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⢀⢀⣀⠀⠀⠀⠏⡖⣚⠀⢀⡸⠋⠉⢹⠀⣽⡇⢠⠏⠉⠉⠓⢦⣹⡀⡠⡆⡀⣠⢇⠔⠂⠃⢢⡀⠀⢾⠄⠀⡶⠒⣄⠀⠀⢿⢧⠀⠈⠓⡿⠊⠉⠀⠀⠀⠀⠀⠀"
            "⠀⢀⠖⣦⠽⠒⠱⠪⠝⢦⣴⣡⢭⠀⠀⢳⣀⢀⣉⡸⠧⠀⣈⠇⠀⠀⡀⠠⡥⡱⡛⣝⡽⢇⠅⠀⠀⠀⠸⠇⠀⠷⢧⢀⢉⡹⠮⠀⠀⣹⠾⣀⢤⠲⣞⡉⣉⣙⠘⠲⣄⡀⠀"
            "⢰⠿⡯⠁⡠⡤⣀⠀⠀⠀⠈⠑⢎⢦⡀⠀⠈⠘⠉⠁⠀⠀⢛⠀⠀⠀⠉⡵⢃⣿⣛⣝⣷⡘⢯⠉⠁⠀⠀⢩⡆⠀⠈⠛⠉⠓⠁⠀⣠⡽⠃⠓⠉⠀⠀⠀⢀⡈⠓⣦⡈⢧⠆"
            "⣼⡰⡅⠸⣁⣚⠀⢺⠀⠀⢀⠀⠀⠀⢳⢦⣠⠦⠤⠄⣀⠀⢀⡷⠗⣃⡼⢏⢃⡛⡽⢿⡓⢚⠽⠒⠠⢤⠤⠒⠁⠀⣠⣤⠤⣤⣀⠞⠃⢀⢤⡀⠀⠀⣄⣳⠋⡙⢦⠈⣆⠼⡟"
            "⢸⣧⠩⢦⣀⢁⣀⠏⠀⠀⠈⠉⠉⠈⠁⠀⠀⠉⠓⠘⠓⠚⠥⣠⠔⠀⠀⢀⠎⠡⣸⡍⠎⢣⠀⠀⠉⣎⡑⢲⠴⠼⠁⠐⠘⠋⠀⠉⠒⠐⠊⠁⠀⠀⣜⣥⠐⠧⠚⢩⣗⠀⠃"
            "⠀⠉⠱⠾⠽⡫⠄⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣀⠀⠀⠀⠀⠀⡥⡇⠀⠀⠀⠀⢀⡔⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⠦⢶⡞⠟⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠫⢤⢀⠾⠁⠹⣀⠀⣠⠝⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
          ];
          opts = {
            position = "center";
            hl = "AlphaHeader";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "  Find File";
              on_press.__raw = "function() require('telescope.builtin').find_files() end";
              opts = {
                shortcut = "f";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
            {
              type = "button";
              val = "  Recent Files";
              on_press.__raw = "function() require('telescope').extensions.frecency.frecency() end";
              opts = {
                shortcut = "r";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
            {
              type = "button";
              val = "󰈭  Find Word";
              on_press.__raw = "function() require('telescope.builtin').live_grep() end";
              opts = {
                shortcut = "g";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
            {
              type = "button";
              val = "󰦛  Restore Session";
              on_press.__raw = "function() require('auto-session').RestoreSession() end";
              opts = {
                shortcut = "s";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
            {
              type = "button";
              val = "  Config";
              on_press.__raw = "function() require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') }) end";
              opts = {
                shortcut = "c";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
            {
              type = "button";
              val = "󰅙  Quit";
              on_press.__raw = "function() vim.cmd('qa') end";
              opts = {
                shortcut = "q";
                position = "center";
                width = 40;
                hl_shortcut = "AlphaShortcut";
              };
            }
          ];
          opts.spacing = 1;
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val.__raw = ''
            function()
              local v = vim.version()
              local version_str = string.format("v%d.%d.%d", v.major, v.minor, v.patch)
              return { " ", " ", "⚡ NixVim " .. version_str .. " ⚡" }
            end
          '';
          opts = {
            position = "center";
            hl = "AlphaFooter";
          };
        }
      ];
    };

    # hide bufferline and statusline on the dashboard
    autoCmd = [
      {
        event = "FileType";
        pattern = "alpha";
        command = "setlocal nofoldenable | lua require('lualine').hide()";
      }
      {
        event = "BufUnload";
        pattern = "<buffer>";
        command = "lua require('lualine').hide({unhide=true})";
      }
    ];
  };
}
