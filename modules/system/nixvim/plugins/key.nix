{ ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      delay = 300;
      icons.mappings = true;
      spec = [
        { __unkeyed-1 = "<leader>g"; group = "Git"; }
        { __unkeyed-1 = "<leader>r"; group = "Rename"; }
        { __unkeyed-1 = "<leader>c"; group = "Code"; }
        { __unkeyed-1 = "<leader>d"; group = "Diagnostics"; }
      ];
    };
  };
}