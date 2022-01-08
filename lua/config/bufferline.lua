require("bufferline").setup({
	options = {
		indicator = {
			style = "underline",
		},
		separator_style = "slant",
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		},
	},
})
