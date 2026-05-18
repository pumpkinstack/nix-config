# {config, ...}:
{
  programs.nixvim = {
    plugins = {
      # luasnip = {
      #   enable = true;
      # };

      blink-cmp = {
        enable = true;
        settings = {
          # snippets.preset = "luasnip";
          sources.default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
      };
    };
  };
}
