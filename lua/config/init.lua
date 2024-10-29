require("nvim-tree").setup()
require("todo-comments").setup()
require("nvim_comment").setup()
require("gitsigns").setup()
require("fidget").setup()

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
require("notify").setup({
	fps = 144,
	render = "minimal",
	stages = "slide",
	timeout = 666,
	top_down = true,
})

require("goto-preview").setup({
	width = 120, -- Width of the floating window
	height = 15, -- Height of the floating window
	border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
	default_mappings = false, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = 36, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
	post_open_hook = function(buf, win)
		local orig_state = vim.api.nvim_buf_get_option(buf, "modifiable")
		vim.api.nvim_buf_set_option(buf, "modifiable", false)
		vim.api.nvim_create_autocmd({ "WinLeave" }, {
			buffer = buf,
			callback = function()
				vim.api.nvim_win_close(win, false)
				vim.api.nvim_buf_set_option(buf, "modifiable", orig_state)
				return true
			end,
		})
	end,
	post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	references = { -- Configure the telescope UI for slowing the references cycling window.
		telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
	},
	-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = true, -- Focus the floating window when opening it.
	dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
	force_close = false, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
	bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
	stack_floating_preview_windows = false, -- Whether to nest floating windows
	preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
	zindex = 1, -- Starting zindex for the stack of floating windows
})
