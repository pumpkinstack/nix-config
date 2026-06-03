{ ... }:

{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 2;
        };
      };
      rainbow-delimiters.enable = true;
    };

    keymaps = [
      {
        key = "<leader>co";
        action = "<CMD>TSContextToggle<CR>";
        options.desc = "Toggle Treesitter context";
      }
    ];
  };
}
