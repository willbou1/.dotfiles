local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.setup({
	automatic_installation = false,
	uses_new_setup = true,
--	ensure_installed = {
--		"awk_ls", "angularls", "asm_lsp",
--		"bashls", "ccls", "csharp_ls",
--		"cmake", "cssls", "docker",
--		"html", "hls", "jsonls",
--		"tsserver", "texlab", "sumneko_lua",
--		"marksman", --[["nimls",]] "perlnavigator",
--		"pyright", "solargraph", "rust_analyzer",
--		"sqlls", "taplo", "lemminx", "yamlls"
--	},
})

local opts = {
	capabilities = capabilities,
	on_attach = on_attach
}

local lspconfig = require("lspconfig")

lspconfig.awk_ls.setup(opts)
lspconfig.angularls.setup(opts)
lspconfig.asm_lsp.setup(opts)
lspconfig.bashls.setup(opts)
lspconfig.ccls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		compilationDatabaseDirectory = "build";
		index = {
			threads = 0;
		};
		clang = {
			excludeArgs = { "-frounding-math"} ;
		};
	}
}
lspconfig.csharp_ls.setup(opts)
lspconfig.cmake.setup(opts)
lspconfig.cssls.setup(opts)
--lspconfig.docker.setup(opts)
lspconfig.html.setup(opts)
lspconfig.hls.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.texlab.setup(opts)
lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
lspconfig.marksman.setup(opts)
lspconfig.nimls.setup(opts)
lspconfig.perlnavigator.setup(opts)
lspconfig.pyright.setup(opts)
lspconfig.solargraph.setup(opts)
lspconfig.rust_analyzer.setup(opts)
lspconfig.sqlls.setup(opts)
lspconfig.taplo.setup(opts)
lspconfig.lemminx.setup(opts)
lspconfig.yamlls.setup(opts)
