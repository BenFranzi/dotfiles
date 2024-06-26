-- install lazy
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

-- installed plugins
require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
  		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		{ 'rose-pine/neovim', name = 'rose-pine' }
	},
	{
		'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' 
	},
	{
		'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig'},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'eandrju/cellular-automaton.nvim' },
	{ 'ThePrimeagen/vim-be-good' },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'mxsdev/nvim-dap-vscode-js', dependencies = {"mfussenegger/nvim-dap"} },
    { 'leoluz/nvim-dap-go' },
    { 'mrcjkb/rustaceanvim', version = '^4', lazy = false }
})