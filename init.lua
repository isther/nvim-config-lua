local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
	vim.print(vim.g.neovide_version)
	vim.o.guifont = "Iosevka Nerd Font:h24:i:b"
end

-- load all plugins
require("plugins")

-- key map
require("keymap")

-- options
require("options")

-- config
require("config")

local async = require("plenary.async")
local notify = require("notify").async

async.run(function()
	notify("👿 Hi ther, just do IT!")
end)
