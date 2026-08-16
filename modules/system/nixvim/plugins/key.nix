{ ... }:
{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        delay = 300;
        icons.mappings = true;
        spec = [
          {
            __unkeyed-1 = "<leader>g";
            group = "Git";
          }
          {
            __unkeyed-1 = "<leader>r";
            group = "Rename";
          }
          {
            __unkeyed-1 = "<leader>c";
            group = "Code";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "Diagnostics";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "Search";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "Buffers";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "Files";
          }
          # LSP actions group — keeps <leader>f free for file pickers
          {
            __unkeyed-1 = "<leader>l";
            group = "LSP";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "Terminal";
          }
        ];
      };
    };
    keymaps = [
      {
        mode = [
          "n"
          "v"
          "i"
        ];
        key = "<C-z>";
        action = "<cmd>undo<cr>";
        options.desc = "Undo";
      }
      {
        mode = [
          "n"
          "v"
          "i"
        ];
        key = "<C-S-z>";
        action = "<cmd>redo<cr>";
        options.desc = "Redo";
      }
      # Toggle line comment — normal & insert mode
      {
        mode = [
          "n"
          "i"
        ];
        key = "<C-/>";
        action = "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>";
        options = {
          silent = true;
          desc = "Toggle line comment";
        };
      }
      # Toggle line comment over a visual selection
      {
        mode = "v";
        key = "<C-/>";
        action.__raw = ''
          function()
            local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
            vim.api.nvim_feedkeys(esc, "nx", false)
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
          end
        '';
        options = {
          silent = true;
          desc = "Toggle comment (selection)";
        };
      }
    ];
  };
}
