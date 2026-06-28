{ ... }:
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      settings = {
        view = {
          width = 30;
          side = "left";
        };
        renderer = {
          group_empty = true;
          highlight_git = true;
          icons.show.git = true;
        };
        filters = {
          dotfiles = false;
          git_ignored = false;
        };
        git.enable = true;
        actions.open_file.quit_on_open = true;
        update_focused_file.enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options.desc = "Toggle file explorer";
      }
      {
        mode = "n";
        key = "<leader>ef";
        action = "<cmd>NvimTreeFindFile<cr>";
        options.desc = "Find current file in explorer";
      }
    ];
  };
}
