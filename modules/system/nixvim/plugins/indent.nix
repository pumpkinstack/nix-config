{ ... }:
{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      indent.char = "│";
      scope.enabled = true; # highlights the current scope
    };
  };
}