{ ... }:
{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      render-markdown.enable = true;
    };
    colorschemes.base16.enable = true;
  };
}
