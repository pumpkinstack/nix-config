{ ... }:
{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      settings = {
        size = 15;
        open_mapping = "[[<C-t>]]";
        direction = "horizontal"; # horizontal | vertical | float | tab
        shade_terminals = true;
        shading_factor = 2;
        start_in_insert = true;
        insert_mappings = true; # <C-t> works from insert mode too
        persist_size = true;
        close_on_exit = true;
        shell = "zsh";
        float_opts = {
          border = "curved";
          width = 120;
          height = 30;
          winblend = 5;
        };
      };
    };

    keymaps = [
      # Toggle the default horizontal terminal
      {
        mode = [
          "n"
          "t"
        ];
        key = "<C-t>";
        action = "<cmd>ToggleTerm<cr>";
        options = {
          silent = true;
          desc = "Toggle terminal";
        };
      }
      # Floating terminal
      {
        mode = [
          "n"
          "t"
        ];
        key = "<leader>tf";
        action = "<cmd>ToggleTerm direction=float<cr>";
        options = {
          silent = true;
          desc = "Terminal (float)";
        };
      }
      # Vertical split terminal
      {
        mode = [
          "n"
          "t"
        ];
        key = "<leader>tv";
        action = "<cmd>ToggleTerm direction=vertical size=60<cr>";
        options = {
          silent = true;
          desc = "Terminal (vertical)";
        };
      }
      # Easy escape back to normal mode from terminal
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          silent = true;
          desc = "Exit terminal mode";
        };
      }
    ];
  };
}
