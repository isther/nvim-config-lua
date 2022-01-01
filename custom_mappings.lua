--
-- 替换默认绑定
--
local hooks = require "core.hooks"

local cmd = vim.api.nvim_command
-- 简化绑定格式
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end


-- 绑定
hooks.add("setup_mappings", function(map)
    -- Setting "leader"
    vim.g.mapleader = " "
    -- Fast ESC
    imap('jj','<ESC>')

    -- qq == EXIT
    nmap('qq', ':q<CR>')

    -- 保存
    nmap('ww', ':w<CR>')

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

    -- 改变窗口大小
    nmap('<up>', ':res +5<CR>')
    nmap('<down>', ':res -5<CR>')
    nmap('<left>', ':vertical resize-5<CR>')
    nmap('<right>', ':vertical resize+5<CR>')

    -- 一键编译/运行/编译运行
    nmap('<F8>', ':w<CR> | :AsyncTask file-build<CR>')
    nmap('<F9>', ':w<CR> | :AsyncTask file-run<CR>')
    nmap('<F10>', ':w<CR> | :AsyncTask file-build<CR> | :AsyncTask file-run<CR>')

    -- 历史修改记录
    nmap('<leader>hs', ':UndotreeToggle <CR>')


    -- 格式化
    nmap('<leader>fm', ':Autoformat <CR>')

    -- nvimtree
    nmap('<leader>ft', ':NvimTreeToggle <CR>')


    -- 在此之上添加按键绑定
    ------------------------------------------
    --
end)
