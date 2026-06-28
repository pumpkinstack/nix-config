{ ... }:
{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          mode = "buffers";
          themable = true;
          separator_style = "thin";
          diagnostics = "nvim_lsp";
          offsets = [
            {
              filetype = "NvimTree";
              text = "File Explorer";
              highlight = "Directory";
              separator = true;
            }
          ];
          show_buffer_close_icons = true;
          show_close_icon = false;
          always_show_bufferline = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options.desc = "Previous buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options.desc = "Close buffer";
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLineTogglePin<cr>";
        options.desc = "Pin buffer";
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options.desc = "Close other buffers";
      }
    ];
  };
}
