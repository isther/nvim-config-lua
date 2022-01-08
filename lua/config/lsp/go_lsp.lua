require ('lspconfig').gopls.setup {
	cmd = {"/home/ubuntu/.local/share/nvim/lsp_servers/go/gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
-- ~/.local/share/nvim/lsp_servers/go/gopls
