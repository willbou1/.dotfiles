os = require('os')

local o = vim.opt

o.termguicolors = true

o.wildignore =
	'*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

o.number = true
o.relativenumber = true
o.cursorline = true
o.mouse = 'ar'
o.colorcolumn = '80'
o.clipboard = 'unnamedplus'
o.fillchars = { vert = '\\' }

o.splitbelow = true
o.splitright = true

o.spelllang = 'en_ca'

o.guifont = 'Monospace:h18'

o.undofile = true
local state_home = os.getenv('XDG_STATE_HOME') or '~/.local/state'
o.undodir = state_home .. '/nvim/undo'
