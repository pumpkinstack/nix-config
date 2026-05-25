{ ... }:
{
  programs.nixvim.plugins = {
    noice = {
      enable = true;
      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        presets = {
          bottom_search = true;       # classic bottom search bar
          command_palette = true;     # position cmdline and popupmenu together
          long_message_to_split = true;
          inc_rename = false;
          lsp_doc_border = true;      # border around LSP hover/signature
        };
      };
    };
    notify.enable = true; # noice depends on nvim-notify
  };
}