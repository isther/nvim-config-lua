-- Utilities for creating configurations
local util = require("formatter.util")

local function c_cpp_format()
	return {
		exe = "clang-format",
		args = {
			'--style="{BasedOnStyle: Google, UseTab: Never, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Attach, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false, ColumnLimit: 0, AccessModifierOffset: -4}"',
		},
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = false,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = { -- Formatter configurations for filetype "lua" go here and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		go = { -- goimport
			function()
				return {
					exe = "goimports",
					args = { "-w", vim.api.nvim_buf_get_name(0) },
					stdin = false,
				}
			end,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		dart = {
			function()
				return {
					exe = "dart",
					args = { "format" },
					stdin = true,
				}
			end,
		},
		toml = {
			function()
				return {
					exe = "taplo",
					args = { "fmt", "-" },
					stdin = true,
					try_node_modules = true,
				}
			end,
		},
		yaml = {
			function()
				return {
					exe = "prettier",
					args = { "--parser", "yaml" },
					stdin = true,
				}
			end,
		},

		c = c_cpp_format,
		cpp = c_cpp_format,

		solidity = function()
			return {
				exe = "forge",
				args = { "fmt", "--raw", "-" },
				stdin = true,
			}
		end,

		cmake = function()
			return {
				exe = "cmake-format",
				args = { "-" },
				stdin = true,
			}
		end,

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
