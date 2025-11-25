vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.o.swapfile = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- basic keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- plugins installer
vim.pack.add({
	'https://github.com/sainnhe/gruvbox-material',
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	'https://github.com/folke/which-key.nvim',
	'https://github.com/nvim-mini/mini.pick',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/mason-org/mason.nvim',
	'https://github.com/neovim/nvim-lspconfig'
})

-- plugins activators
require 'mini.pick'.setup()
require 'oil'.setup({ view_options = { show_hidden = true } })
require 'mason'.setup()
require('lsp_configs.roslyn_ls')
require('render-markdown').setup({})

-- plugin keymaps
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>e', ':Oil <CR>')


vim.lsp.enable({ "lua_ls", "roslyn_ls" })

-- theme
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_palette    = "material"
vim.cmd("colorscheme gruvbox-material")
