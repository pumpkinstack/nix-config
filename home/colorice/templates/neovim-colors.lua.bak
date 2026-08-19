require('base16-colorscheme').setup({
  base00 = "{background}",
  base01 = "{background.darken_15}",
  base02 = "{background.darken_8}",
  base03 = "{color8.darken_20}",
  base04 = "{foreground.darken_20}",
  base05 = "{foreground}",
  base06 = "{background}",
  base07 = "{background.lighten_20}",

  base08 = "{color4.darken_5}",
  base09 = "{color4}",
  base0A = "{color3}",
  base0B = "{color2}",
  base0C = "{color4.lighten_20}",
  base0D = "{color2.lighten_20}",
  base0E = "{color3.lighten_20}",
  base0F = "{color3.darken_10}",
})


-- We first theme base16, but we also need to fix some other colors that don't
-- contrast well by default

-- Helper function to set multiple highlight groups at once
local function set_hl_mutliple(groups, value)
  for _, v in pairs(groups) do
    vim.api.nvim_set_hl(0, v, value)
  end
end

-- Make selected text stand out more
vim.api.nvim_set_hl(0, 'Visual', {
  bg = '{color2.lighten_20}',
  fg = '{background}', -- normal text contrast
})

-- Make "string" text contrast better
set_hl_mutliple({ '@string', '@string.special' }, {
  fg = '{color4.darken_15}',
})

-- Grey out comments
set_hl_mutliple({ '@comment' }, {
  fg = '{color8}',
  italic = true,
})

-- Color in other highlight groups as you see fit!

set_hl_mutliple({ '@function', '@function.method' }, {
  fg = '{color3}',
})

set_hl_mutliple({ 'Keyword', 'TSKeyword', 'TSKeywordFunction', 'TSRepeat' }, {
  fg = '{color2.lighten_30}',
})

-- Cursor line background
vim.api.nvim_set_hl(0, 'CursorLine', {
  bg = '{background.lighten_5}',
})

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', {
  fg = '{color8.darken_20}',
})
vim.api.nvim_set_hl(0, 'CursorLineNr', {
  fg = '{color2}',
  bold = true,
})

-- Floating windows (LSP hover, cmp, etc.)
vim.api.nvim_set_hl(0, 'NormalFloat', {
  bg = '{background.darken_15}',
})
vim.api.nvim_set_hl(0, 'FloatBorder', {
  fg = '{color8.darken_20}',
  bg = '{background.darken_15}',
})

-- Search highlights
vim.api.nvim_set_hl(0, 'Search', {
  bg = '{color3.lighten_20}',
  fg = '{background}',
})

-- nvim-tree / file explorer sidebar
vim.api.nvim_set_hl(0, 'NvimTreeNormal', {
  bg = '{background.darken_15}',
})

-- Diagnostic underlines (LSP errors/warnings)
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '{color1}', undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn',  { sp = '{color4}', undercurl = true })

-- Indent guides (you have indent-blankline)
vim.api.nvim_set_hl(0, 'IblIndent', {
  fg = '{background.darken_8}',
})
vim.api.nvim_set_hl(0, 'IblScope', {
  fg = '{color8.darken_20}',
})