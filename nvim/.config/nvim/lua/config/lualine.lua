local pywal_core = require('pywal.core')
local colors = pywal_core.get_colors()

local bubbles_theme = {
  normal = {
    a = { fg = colors.color0, bg = colors.color4 },
    b = { fg = colors.color7, bg = colors.color1 },
    c = { fg = colors.color8, bg = colors.color0 },
  },

  insert = { a = { fg = colors.color0, bg = colors.color8 } },
  visual = { a = { fg = colors.color0, bg = colors.color2 } },
  replace = { a = { fg = colors.color0, bg = colors.color8 } },

  inactive = {
    a = { fg = colors.color8, bg = colors.color0 },
    b = { fg = colors.color8, bg = colors.color0 },
    c = { fg = colors.color0, bg = colors.color0 },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = { 'diagnostics' },
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
