local g = vim.g

-- Neovide
g.neovide_cursor_vfx_mode = "pixiedust"
g.neovide_refresh_rate = 100
g.neovide_transparency = 0.75

g.colors_name = 'pywal'
g.mapleader = ' '

-- Firenvim

local local_settings = {}
local_settings['.*'] = {
	cmdline = 'nvim',
	priority = 0,
	selector = 'textarea',
	takeover = 'never'
}
local_settings['https?://[^/]*youtu\\.?be[^/]*/'] = {
	selector = '#contenteditable-root',
	takeover = 'always'
}

g.firenvim_config = {
	globalSettings = {
		alt = 'all'
	},
	localSettings = local_settings
}
