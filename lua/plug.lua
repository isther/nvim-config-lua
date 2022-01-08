local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- packer
	use ("wbthomason/packer.nvim")
	-- {{{Theme
	use ('Mofiqul/dracula.nvim' )
	use ('glepnir/dashboard-nvim')
	use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true}}
	use {'kdheepak/tabline.nvim',requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }}
	--- }}}

	-- {{{nvim-telescope
	use	{'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
	use	{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
	-- }}}

	-- {{{edit
	use	('windwp/nvim-autopairs')
	use	('terrortylor/nvim-comment')
	-- }}}

	-- {{{ GOPLS
	use ('fatih/vim-go')
	-- }}}

	-- {{{lsp plugins
	use ('neovim/nvim-lspconfig')
	use ('williamboman/nvim-lsp-installer')
	use ('onsails/lspkind-nvim')
	-- }}}

	-- {{{snippets
	use ('sirver/ultisnips')
	use ('quangnguyen30192/cmp-nvim-ultisnips')
	-- }}}

	-- {{{autoformat
	use ('Chiel92/vim-autoformat')
	-- }}}

	-- {{{file tree
	use {'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons'}}
	-- }}}

	-- {{{float terminal
	use ('voldikss/vim-floaterm')
	-- }}}

	-- {{{autocompletion
	use ({'hrsh7th/nvim-cmp',requires = {{ 'hrsh7th/cmp-nvim-lsp' },{ 'hrsh7th/cmp-path' },{ 'hrsh7th/cmp-buffer' },},})
	-- }}}

	-- {{{git signature
	use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'}}
	-- }}}

	-- {{{other
	use ('wakatime/vim-wakatime')
	use ("dstein64/vim-startuptime")
	use ('ggandor/lightspeed.nvim')
	use ('luukvbaal/stabilize.nvim')
	-- }}}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
