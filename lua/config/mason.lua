require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "clangd", "cmake", "rust_analyzer", "tsserver" },
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.golangci_lint_ls.setup({})
lspconfig.cmake.setup({})
lspconfig.clangd.setup({})
lspconfig.pylsp.setup({})
lspconfig.rust_analyzer.setup({
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

---{{{ html css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").html.setup({
	capabilities = capabilities,
})
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
--}}}

lspconfig.tsserver.setup({})
lspconfig.taplo.setup({})
lspconfig.volar.setup({})
