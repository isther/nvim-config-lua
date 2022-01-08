require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "clangd", "cmake", "rust_analyzer" },
})

require("lspconfig").lua_ls.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").cmake.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			cargo = {
				extraArgs = {
					-- "--target",
				},
			},
		},
	},
})
