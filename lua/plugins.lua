require("lazy").setup({
	--{{{ Lsp
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	},
	--}}}
	--{{{ Formmat
	"mhartington/formatter.nvim",
	--}}}
	-- {{{ Comment
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" }, -- Todo
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({})
		end,
	},
	-- }}}
	-- {{{ Theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		-- tag = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	"fgheng/winbar.nvim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	"yamatsum/nvim-cursorline",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Git signature
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
	-- }}}
	-- {{{ Cmp
	"hrsh7th/nvim-cmp",
	-- source
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-emoji",
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"zbirenbaum/copilot.lua",
		{
			"zbirenbaum/copilot-cmp",
			after = { "copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		},
	},
	"onsails/lspkind-nvim",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
	},
	{
		"jinzhongjia/LspUI.nvim",
		branch = "main",
		config = function()
			require("LspUI").setup({
				-- config options go here
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- }}}
	-- {{{ LeetCode
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- telescope 所需
			"MunifTanjim/nui.nvim",

			-- 可选
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			lang = "golang",
			cn = {
				enabled = true,
			},
			image_support = false,
			injector = { ---@type table<lc.lang, lc.inject>
				["cpp"] = {
					before = {
						"#include <bits/stdc++.h>",
						"using namespace std;",
					},
					after = "int main() {}",
				},
				["golang"] = {
					before = { "package leetcode" },
				},
			},
		},
	},
	-- }}}
	--{{{ Other
	{

		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	{
		"NStefan002/screenkey.nvim",
		lazy = false,
		version = "*", -- or branch = "dev", to use the latest commit
	},
	{
		"rcarriga/nvim-notify",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.2",
		run = ":TSUpdate",
	},

	"wakatime/vim-wakatime", -- wakatime plugin
	"farmergreg/vim-lastplace", -- Last place
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- "mrcjkb/rustaceanvim",
	--}}}
})
