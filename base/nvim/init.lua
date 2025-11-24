vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.o.swapfile = false

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
	'https://github.com/sainnhe/gruvbox-material',
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/nvim-mini/mini.pick',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/neovim/nvim-lspconfig'
})

vim.cmd("set completeopt+=noselect")

require 'mini.pick'.setup()
require 'oil'.setup()
require 'mason'.setup()
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ':Oil <CR>')

vim.lsp.enable({ "lua_ls", "roslyn_ls" })
dofile(os.getenv("HOME") .. "/Work/dotfiles/base/nvim/lsp_configs/roslyn_ls.lua")
require('render-markdown').setup({})

vim.g.gruvbox_material_background = "medium"   -- or "soft", "hard"
vim.g.gruvbox_material_palette    = "material" -- or "mix", "original"
vim.cmd("colorscheme gruvbox-material")
