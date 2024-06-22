local cmp = require("cmp")
local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})

-- gray
vim.cmd([[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]])

-- blue
vim.cmd([[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]])
vim.cmd([[highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch]])
-- light blue
vim.cmd([[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]])
vim.cmd([[highlight! link CmpItemKindInterface CmpItemKindVariable]])
vim.cmd([[highlight! link CmpItemKindText CmpItemKindVariable]])
-- pink
vim.cmd([[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]])
vim.cmd([[highlight! link CmpItemKindMethod CmpItemKindFunction]])
-- front
vim.cmd([[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]])
vim.cmd([[highlight! link CmpItemKindProperty CmpItemKindKeyword]])
vim.cmd([[highlight! link CmpItemKindUnit CmpItemKindKeyword]])

-- Global setup.
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	formatting = {
		fields = {
			cmp.ItemField.Menu,
			cmp.ItemField.Abbr,
			cmp.ItemField.Kind,
		},
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				lua_snip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				copilot = "[Copilot]",
			},
			symbol_map = { Copilot = "" },
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
	},
	-- snippet = {
	-- 	expand = function(args) end,
	-- },

	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		-- { name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
	}),
})

-- '/' cmdline setup
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- ':' cmpline setup
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
