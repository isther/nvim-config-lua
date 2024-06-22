require("lspsaga").setup({
	border_style = "round",
	error_sign = " ",
	warn_sign = " ",
	hint_sign = " ",
	infor_sign = " ",
	diagnostic_header_icon = " ",
	code_action_icon = " ",
	code_action_prompt = { enable = false, sign = true, sign_priority = 40, virtual_text = true },
	code_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<Esc>",
		exec = "<CR>",
	},
	diagnostic = {
		max_height = 0.8,
		keys = {
			quit = { "q", "<ESC>" },
		},
		on_insert = false,
		show_virt_line = false,
	},
	symbol_in_winbar = {
		enable = true,
		show_file = true,
		separator = "  ",
		color_mode = false,
	},
	implement = {
		enable = true,
		sign = true,
		virtual_text = true,
		priority = 100,
	},
})
