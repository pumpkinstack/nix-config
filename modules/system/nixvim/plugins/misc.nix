{ ... }:
{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      render-markdown.enable = true;

      todo-comments = {
        enable = true;
        settings.signs = true;
      };

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add.text = "▎";
            change.text = "▎";
            delete.text = "";
          };
          # Show current line blame inline (toggle with <leader>gb)
          current_line_blame = false;
        };
      };
    };

    keymaps = [
      # Gitsigns — hunk navigation & actions
      {
        mode = "n";
        key = "]h";
        action.__raw = "function() require('gitsigns').next_hunk() end";
        options.desc = "Next git hunk";
      }
      {
        mode = "n";
        key = "[h";
        action.__raw = "function() require('gitsigns').prev_hunk() end";
        options.desc = "Previous git hunk";
      }
      {
        mode = "n";
        key = "<leader>gs";
        action.__raw = "function() require('gitsigns').stage_hunk() end";
        options.desc = "Stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gu";
        action.__raw = "function() require('gitsigns').undo_stage_hunk() end";
        options.desc = "Undo stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action.__raw = "function() require('gitsigns').reset_hunk() end";
        options.desc = "Reset hunk";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action.__raw = "function() require('gitsigns').preview_hunk() end";
        options.desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action.__raw = "function() require('gitsigns').toggle_current_line_blame() end";
        options.desc = "Toggle line blame";
      }
      # Todo comments navigation
      {
        mode = "n";
        key = "]t";
        action = "<cmd>TodoNext<cr>";
        options.desc = "Next TODO comment";
      }
      {
        mode = "n";
        key = "[t";
        action = "<cmd>TodoPrev<cr>";
        options.desc = "Previous TODO comment";
      }
      {
        mode = "n";
        key = "<leader>st";
        action = "<cmd>TodoTelescope<cr>";
        options.desc = "Todo (Telescope)";
      }
    ];
  };
}
