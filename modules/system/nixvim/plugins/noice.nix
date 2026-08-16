{ ... }:
{
  programs.nixvim.plugins = {
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          # Override cmp docs renderer so LSP docs look consistent in the completion menu
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = true; # classic bottom search bar
          command_palette = true; # cmdline + popupmenu together
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = true; # border on LSP hover/signature
        };
      };
    };
    notify.enable = true; # noice depends on nvim-notify
  };
}
