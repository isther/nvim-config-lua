local g = vim.g
local cmp = require('cmp')

local M = {}

-- 简化绑定格式
function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map('n', shortcut, command)
end

local function imap(shortcut, command)
	map('i', shortcut, command)
end

g.mapleader = " "

-- exit insert
imap('jj','<ESC>')

-- qq == EXIT
nmap('qq', ':q!<CR>')

-- 保存
nmap('ww', ':w<CR>')

-- float terminal
nmap('<leader>tn', ':FloatermNew <CR>') --new a terminal

-- 快速分屏
nmap('<leader>sl', ':set splitright<CR>:vsplit<CR>')
nmap('<leader>sh', ':set nosplitright<CR>:vsplit<CR>')
nmap('<leader>sj', ':set splitright<CR>:split<CR>')
nmap('<leader>sk', ':set nosplitright<CR>:split<CR>')

-- 在分屏间移动
nmap('<leader>wh', '<C-w>h')
nmap('<leader>wj', '<C-w>j')
nmap('<leader>wk', '<C-w>k')
nmap('<leader>wl', '<C-w>l')

-- nvimtree
nmap('<leader>ft', ':NvimTreeToggle <CR>')

-- 格式化
nmap('<leader>fm', ':Autoformat <CR>')

-- comment
nmap('<leader>/', ':CommentToggle <CR>')

-- tabline
nmap('<leader>bn', ':TablineTabNew <CR>')
nmap('<leader>b-', ':TablineBufferPrevious <CR>')
nmap('<leader>b=', ':TablineBufferNext <CR>')

-- telescope
nmap('<leader>ff', ':Telescope find_files <CR>')
nmap('<leader>fr', ':Telescope oldfiles <CR>')
nmap('<leader>fw', ':Telescope live_grep <CR>')
nmap('<leader>fn', ':Telescope DashboardNewFile <CR>')
nmap('<leader>fb', ':Telescope marks <CR>')
nmap('<leader>h' , ':view ~/.config/nvim/doc/helpdoce.md')

-- cmp
M.cmp_mappings = {
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
}

-- gitsigns
M.gitsigns_mappings = {
	noremap = true,
	['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
	['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

	['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
	['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
	['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
	['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
	['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
	['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
	['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
	['n <leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

	-- Text objects
	['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
}

return M
