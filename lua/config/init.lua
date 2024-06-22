require("nvim-tree").setup()
require("todo-comments").setup()
require("nvim_comment").setup()
require("gitsigns").setup()

require("config.mason")
require("config.winbar")
require("config.lualine")
require("config.cursorline")
require("config.bufferline")
require("config.cmp")
require("config.blankline")
require("config.telescope")
require("config.nvim-treesitter")
require("config.formatter")
require("config.lspsaga")
require("notify").setup({
	fps = 144,
	render = "minimal",
	stages = "slide",
	timeout = 666,
	top_down = false,
})
