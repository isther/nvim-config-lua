local g = vim.g

local M = {}

-- {{{简化绑定格式
local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function imap(shortcut, command)
	map("i", shortcut, command)
end

local function tmap(shortcut, command)
	map("t", shortcut, command)
end

local function vmap(shortcut, command)
	map("v", shortcut, command)
end

-- }}}
--{{{leader
g.mapleader = " "
--}}}
-- {{{exit insert
imap("jj", "<ESC>")
-- }}}
-- {{{qq == EXIT
nmap("qq", ":q<CR>")
-- }}}
-- {{{快速分屏
nmap("<leader>sl", ":set splitright<CR>:vs<CR>")
nmap("<leader>sh", ":set nosplitright<CR>:vs<CR>")
nmap("<leader>sj", ":set splitright<CR>:sp<CR>")
nmap("<leader>sk", ":set nosplitright<CR>:sp<CR>")
-- }}}
-- {{{在分屏间移动
nmap("<leader>wh", "<C-w>h")
nmap("<leader>wj", "<C-w>j")
nmap("<leader>wk", "<C-w>k")
nmap("<leader>wl", "<C-w>l")
-- }}}
-- {{{格式化
nmap("<leader>fm", ":FormatWrite <CR>")
-- nmap("<leader>fm", ":lua vim.lsp.buf.format( { timeout_ms = 2000 } ) <CR>")

--- }}}
-- {{{comment
nmap("<leader>/", ":CommentToggle <CR>")
vmap("<leader>/", ":CommentToggle <CR>")
-- }}}
--{{{ terminal
nmap("<leader>tf", ":ToggleTerm direction=float <CR>")
nmap("<leader>th", ":ToggleTerm direction=horizontal <CR>")
-- nmap("<leader>tv", ":ToggleTerm direction=vertical <CR>")
nmap("<leader>tt", ":ToggleTerm direction=tab <CR>")
tmap("<ESC>", "<C-\\><C-n>")
tmap("jj", "<C-\\><C-n>")
--}}}
--{{{ terminal for lazygit
nmap(
	"<leader>lg",
	'<cmd>lua  require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float"}):toggle() <CR>'
)
--}}}
-- {{{barbar
nmap("<leader>bqp", ":BufferLinePickClose <CR>") -- 关闭所选buffer
nmap("<leader>bql", ":BufferLineCloseLeft <CR>") -- 关闭当前左侧buffer
nmap("<leader>bqr", ":BufferLineCloseRight <CR>") -- 关闭当前右侧所有buffer

nmap("<leader>-", ":BufferLineCyclePrev <CR>") -- 移动到前一个buffer
nmap("<leader>=", ":BufferLineCycleNext <CR>") -- 移动到后一个buffer

nmap("<leader>1", ":BufferLineGoToBuffer 1 <CR>")
nmap("<leader>2", ":BufferLineGoToBuffer 2 <CR>")
nmap("<leader>3", ":BufferLineGoToBuffer 3 <CR>")
nmap("<leader>4", ":BufferLineGoToBuffer 4 <CR>")
nmap("<leader>5", ":BufferLineGoToBuffer 5 <CR>")
nmap("<leader>6", ":BufferLineGoToBuffer 6 <CR>")
nmap("<leader>7", ":BufferLineGoToBuffer 7 <CR>")
nmap("<leader>8", ":BufferLineGoToBuffer 8 <CR>")
nmap("<leader>9", ":BufferLineGoToBuffer 9 <CR>")
nmap("<leader>0", ":BufferLineGoToBuffer 0 <CR>")
--- }}}
--{{{ TODOList
nmap("<leader>td", ":TodoTelescope <CR>")
--}}}
-- {{{ Lsp utils
nmap("<leader>rn", ":LspUI rename <CR>")
nmap("<leader>tb", ":Telescope diagnostics <CR>")
nmap("<leader>ol", ":Navbuddy <CR>")
nmap("<leader>dfg", ":Telescope lsp_definitions<CR>")
nmap("<leader>dfp", "<cmd>lua require('goto-preview').goto_preview_definition() <CR>")
nmap("<leader>fd", ":Telescope lsp_references <CR>")
-- }}}
-- {{{telescope
nmap("<leader>ff", ":Telescope find_files <CR>")
nmap("<leader>fg", ":Telescope grep_string theme=cursor <CR>")
nmap("<leader>fs", ":Telescope live_grep<CR>")
nmap("<leader>tm", ":Telescope colorscheme theme=cursor <CR>")
-- }}}
--{{{ NvimTree
nmap("<leader>ft", ":NvimTreeToggle <CR>")
--}}}
-- {{{gitsigns
nmap("<leader>dd", ":Gitsigns diffthis <CR>")
-- }}}
return M
