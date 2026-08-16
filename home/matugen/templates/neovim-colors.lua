require('base16-colorscheme').setup({
  base00 = "{{colors.background.default.hex}}",
  base01 = "{{colors.surface_container_lowest.default.hex}}",
  base02 = "{{colors.surface_container_low.default.hex}}",
  base03 = "{{colors.outline_variant.default.hex}}",
  base04 = "{{colors.on_surface_variant.default.hex}}",
  base05 = "{{colors.on_surface.default.hex}}",
  base06 = "{{colors.inverse_on_surface.default.hex}}",
  base07 = "{{colors.surface_bright.default.hex}}",

  base08 = "{{colors.tertiary.default.hex | lighten: -5}}",
  base09 = "{{colors.tertiary.default.hex}}",
  base0A = "{{colors.secondary.default.hex}}",
  base0B = "{{colors.primary.default.hex}}",
  base0C = "{{colors.tertiary_container.default.hex}}",
  base0D = "{{colors.primary_container.default.hex}}",
  base0E = "{{colors.secondary_container.default.hex}}",
  base0F = "{{colors.secondary.default.hex | lighten: -10}}",
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
  bg = '{{colors.primary_container.default.hex}}',
  fg = '{{colors.on_primary_container.default.hex}}', -- normal text contrast
})

-- Make "string" text contrast better
set_hl_mutliple({ '@string', '@string.special' }, {
  fg = '{{colors.tertiary.default.hex | lighten: -15.0}}',
})

-- Grey out comments
set_hl_mutliple({ '@comment' }, {
  fg = '{{colors.outline.default.hex}}',
  italic = true,
})

-- Color in other highlight groups as you see fit!

set_hl_mutliple({ '@function', '@function.method' }, {
  fg = '{{colors.secondary.default.hex}}',
})

set_hl_mutliple({ 'Keyword', 'TSKeyword', 'TSKeywordFunction', 'TSRepeat' }, {
  fg = '{{colors.inverse_primary.default.hex}}',
})

-- Cursor line background
vim.api.nvim_set_hl(0, 'CursorLine', {
  bg = '{{colors.surface_container.default.hex}}',
})

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', {
  fg = '{{colors.outline_variant.default.hex}}',
})
vim.api.nvim_set_hl(0, 'CursorLineNr', {
  fg = '{{colors.primary.default.hex}}',
  bold = true,
})

-- Floating windows (LSP hover, cmp, etc.)
vim.api.nvim_set_hl(0, 'NormalFloat', {
  bg = '{{colors.surface_container_lowest.default.hex}}',
})
vim.api.nvim_set_hl(0, 'FloatBorder', {
  fg = '{{colors.outline_variant.default.hex}}',
  bg = '{{colors.surface_container_lowest.default.hex}}',
})

-- Search highlights
vim.api.nvim_set_hl(0, 'Search', {
  bg = '{{colors.secondary_container.default.hex}}',
  fg = '{{colors.on_secondary_container.default.hex}}',
})

-- nvim-tree / file explorer sidebar
vim.api.nvim_set_hl(0, 'NvimTreeNormal', {
  bg = '{{colors.surface_container_lowest.default.hex}}',
})

-- Diagnostic underlines (LSP errors/warnings)
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '{{colors.error.default.hex}}', undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn',  { sp = '{{colors.tertiary.default.hex}}', undercurl = true })

-- Indent guides (you have indent-blankline)
vim.api.nvim_set_hl(0, 'IblIndent', {
  fg = '{{colors.surface_container_low.default.hex}}',
})
vim.api.nvim_set_hl(0, 'IblScope', {
  fg = '{{colors.outline_variant.default.hex}}',
})