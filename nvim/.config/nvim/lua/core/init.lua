require('core.options')
require('core.globals')
require('core.keymap')
require('core.highlights')

vim.cmd [[
	colorscheme pywal
]]

require('impatient')
require('core.plugins')
require('init.lsp')
