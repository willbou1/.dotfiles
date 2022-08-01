local api = vim.api

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local augroup = api.nvim_create_augroup('packer_auto_compile', {clear = true})

api.nvim_create_autocmd('BufWritePost', {
	pattern = '*/nvim/lua/**/plugins.lua',
	group = augroup,
	desc = 'Compile packer file after it\'s changed',
	command = 'source <afile> | PackerCompile'
})

-- Load packer.nvim
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use { 'lewis6991/impatient.nvim' }

	use { "ellisonleao/gruvbox.nvim" }
	use {
		"AlphaTechnolog/pywal.nvim",
		requires = {
			'rktjmp/fwatch.nvim'
		},
		config = [[require('config.pywal')]]
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = function ()
			require'colorizer'.setup()
		end
	}
	use { "vifm/vifm.vim" }

	use {
	    'glacambre/firenvim',
	    run = function() vim.fn['firenvim#install'](0) end
	}
	use { "turbio/bracey.vim" }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim'
		},
		config = [[require('config.telescope')]]
	}
	use {
		'nvim-telescope/telescope-fzy-native.nvim',
		requires = 'nvim-telescope/telescope.nvim',
		config = function ()
			require('telescope').load_extension('fzy_native')
		end
	}
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		requires = 'nvim-telescope/telescope.nvim',
		config = function ()
			require('telescope').load_extension('file_browser')
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = [[require('config.lualine')]]
	}
	use { 'vimpostor/vim-tpipeline' }

	use { 'tpope/vim-fugitive' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = [[require('config.ts')]]
	}

	use {
		'lewis6991/spellsitter.nvim',
		requires = 'nvim-treesitter/nvim-treesitter',
		config = function ()
			require('spellsitter').setup()
		end
	}
	use { 'vigoux/architext.nvim' }
	use { 'nvim-treesitter/playground' }

	use {
		'mg979/vim-visual-multi',
		branch = 'master'
	}

	use 'neovim/nvim-lspconfig'
	use { 'williamboman/nvim-lsp-installer' }

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'onsails/lspkind.nvim'
		},
		config = [[require('config.cmp')]]
	}

	use { 'hrsh7th/vim-vsnip' }

	use {
		'mfussenegger/nvim-dap',
		config = [[require('config.dap')]]
	}
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap"
		},
		config = function ()
			require("dapui").setup()
		end
	}


	if packer_bootstrap then
		require('packer').sync()
	end
end)
