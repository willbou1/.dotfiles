local api = vim.api

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local augroup = api.nvim_create_augroup('packer_auto_compile', {clear = true})

api.nvim_create_autocmd('BufWritePost', {
	pattern = '*/nvim/lua/core/plugins.lua',
	group = augroup,
	desc = 'Compile packer file after it\'s changed',
	command = 'source <afile> | PackerCompile'
})

-- Load packer.nvim
return require('packer').startup(function(use)
	use { 'elkowar/yuck.vim' }
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }

    use {
        'edluffy/hologram.nvim',
        config = function ()
            require('hologram').setup{
                auto_display = true
            }
        end
    }

	use { "vifm/vifm.vim" }

	use {
	    'glacambre/firenvim',
	    run = function() vim.fn['firenvim#install'](0) end
	}
	use { "turbio/bracey.vim" }

	use { 'tpope/vim-fugitive' }

	use {
		'mg979/vim-visual-multi',
		branch = 'master'
	}

	use { 'hrsh7th/vim-vsnip' }

	use { 'mbbill/undotree' }

    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup_ts_grammar()
            require('orgmode').setup{}
        end
    }

    -- Theming ----------------------------------------------------------------
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

    -- Treesitter -------------------------------------------------------------
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

    -- Tmux  ------------------------------------------------------------------
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })

    -- UI ---------------------------------------------------------------------
    use {
        'nvim-tree/nvim-web-devicons'
    }
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = [[require('config.lualine')]]
	}
	use { 'vimpostor/vim-tpipeline' }
	use {
		'romgrk/barbar.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = [[require('config.barbar')]]
	}
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = [[require('config.startup')]]
    }

    -- Telescope --------------------------------------------------------------
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

    -- LSP plugins ------------------------------------------------------------
    use {
        "williamboman/mason.nvim",
        config = function ()
            require('mason').setup()
        end
    }
    use {
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        "neovim/nvim-lspconfig",
        config = [[require('config.lsp')]]
    }
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
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
        end
    }
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = function ()
            require('nvim-lightbulb').setup({autocmd = {enabled = true}})
        end
    }
    use{
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    }

    -- DAP --------------------------------------------------------------------
	use {
        requires = {
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
		'mfussenegger/nvim-dap',
		config = [[require('config.dap')]]
	}
	use {
		requires = {
			"mfussenegger/nvim-dap"
		},
		"rcarriga/nvim-dap-ui",
		config = function ()
			require("dapui").setup()
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
