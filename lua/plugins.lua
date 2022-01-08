require("lazy").setup({
	--{{{ Lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	},
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
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
	-- {{{ Outline
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
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
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
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
	"tami5/lspsaga.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- }}}
	--{{{ Other
	{

		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	"wakatime/vim-wakatime", -- wakatime plugin
	"farmergreg/vim-lastplace", -- Last place
	-- "rcarriga/nvim-notify",
	-- "luukvbaal/stabilize.nvim",
	-- "simrat39/rust-tools.nvim",
	--}}}
})
