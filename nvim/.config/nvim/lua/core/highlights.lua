local api = vim.api

-- Spelling
api.nvim_set_hl(0, 'SpellBad', { cterm = {underline} })
api.nvim_set_hl(0, 'SpellLocal', { cterm = {underline} })
api.nvim_set_hl(0, 'SpellRare', { cterm = {underline} })
api.nvim_set_hl(0, 'SpellCap', { cterm = {underline} })

-- Neovide
--api.nvim_set_hl(0, 'Normal', {guibg = 'none'})
--api.nvim_set_hl(0, 'NonText', {guibg = 'none'})
