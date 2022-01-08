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
--{{{ Trouble
nmap("<leader>tb", ":TroubleToggle <CR>")
--}}}
--{{{ TODOList
nmap("<leader>td", ":TodoTelescope <CR>")
--}}}
-- {{{telescope
nmap("<leader>ff", ":Telescope find_files <CR>")
nmap("<leader>fg", ":Telescope grep_string theme=cursor <CR>")
nmap("<leader>fs", ":Telescope live_grep<CR>")
nmap("<leader>tm", ":Telescope colorscheme theme=cursor <CR>")
nmap("<leader>fb", ":Telescope file_browser theme=ivy <CR>")
nmap("<leader>mp", ":Telescope keymaps theme=dropdown <CR>")
-- }}}
--{{{telescope for lsp
nmap("<leader>dff", ":Telescope lsp_definitions <CR>")
nmap("<leader>dft", ":Telescope lsp_type_definitions <CR>")
nmap("<leader>re", ":Telescope lsp_references <CR>")
nmap("<leader>ca", ":lua vim.lsp.buf.code_action() <CR>")
-- }}}
--{{{ telescope for git
nmap("<leader>gs", ":Telescope git_status <CR>")
nmap("<leader>gb", ":Telescope git_branches theme=cursor<CR>")
nmap("<leader>gc", ":Telescope git_commits <CR>")
nmap("<leader>gt", ":Telescope git_bcommits <CR>")
--}}}
--{{{ NvimTree
nmap("<leader>ft", ":NvimTreeToggle <CR>")
--}}}
-- {{{ Lspsaga
-- help information
nmap("<leader>hh", ":Lspsaga hover_doc <CR>")
-- rename
nmap("<leader>rn", ":Lspsaga rename <CR>")
--}}}
-- {{{gitsigns
nmap("<leader>dd", ":Gitsigns diffthis <CR>")
-- }}}
--{{{
nmap("<leader>np", "<cmd>AerialNavToggle<CR>")
nmap("<leader>pp", "<cmd>AerialPrev<CR>")
nmap("<leader>nn", "<cmd>AerialNext<CR>")
--}}}
return M
