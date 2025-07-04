local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local o = vim.o

cmd("syntax enable") -- syntax highlighting
o.rnu = true -- relative line numbers
o.nu = true -- line numbers
o.mouse = "a" -- mouse controls
o.modeline = true -- modline
o.modelines = 5

o.errorbells = false -- auditory stimulation annoying

opt.ruler = false
opt.hidden = true -- keeps buffers loaded in the background
opt.ignorecase = true
opt.scrolloff = 8 -- buffer starts scrolling 8 lines from the end of view

-- Tab settings
o.tabstop = 4 -- 4 tabstop
o.shiftwidth = 4
o.expandtab = false -- tabs -> spaces
o.smartindent = true -- nice indenting

o.foldmethod = "marker" -- set fold method to marker

-- backup/swap files
opt.swapfile = false -- have files saved to swap
opt.undofile = true -- file undo history preserved outside current session

-- new win split options
opt.splitbelow = true
opt.splitright = true
o.completeopt = "menuone,noselect"

--encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.termguicolors = true
o.clipboard = "unnamedplus" -- install xsel or xclip

vim.wo.fillchars = "eob: "

vim.cmd("colorscheme catppuccin-frappe")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")
vim.cmd("set foldlevel=0")
vim.cmd("set nowrap")
