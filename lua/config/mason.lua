-- General/Global LSP Configuration
local api = vim.api
local lsp = vim.lsp

local make_client_capabilities = lsp.protocol.make_client_capabilities
function lsp.protocol.make_client_capabilities()
	local caps = make_client_capabilities()
	if not (caps.workspace or {}).didChangeWatchedFiles then
		vim.notify("lsp capability didChangeWatchedFiles is already disabled", vim.log.levels.WARN)
	else
		caps.workspace.didChangeWatchedFiles = nil
	end

	return caps
end

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "clangd", "cmake", "rust_analyzer", "tsserver" },
})

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.gopls.setup({
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
})
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
