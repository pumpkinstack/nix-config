{
  programs.nixvim = {
    plugins.emmet.enable = true;

    keymaps = [
      {
        mode = "i";
        key = "<C-q>";
        options.expr = true;
        options.desc = "Expand emmet abbreviation or insert literal <C-q>";
        action.__raw = ''
          function()
            if vim.fn["emmet#isExpandable"]() == 1 then
              return "<Plug>(emmet-expand-abbr)"
            else
              return "<C-q>"
            end
          end
        '';
      }
    ];
  };
}