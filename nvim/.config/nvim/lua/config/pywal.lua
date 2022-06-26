local pywal = require('pywal')
pywal.setup()

local pywal_core = require('pywal.core')
local colors = pywal_core.get_colors()

local hibg = function(group, key, val)
	vim.cmd(
	string.format(
	[[highlight %s gui%s=%s]],
	group, key, val		)
	)
end

hibg('ColorColumn', 'bg', colors.color1)
