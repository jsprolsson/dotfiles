vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.wrap = true
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
'https://github.com/sainnhe/gruvbox-material',
'https://github.com/MeanderingProgrammer/render-markdown.nvim',
'https://github.com/folke/which-key.nvim',
'https://github.com/neovim/nvim-lspconfig',
})

vim.g.gruvbox_material_background = "medium"   -- or "soft", "hard"
vim.g.gruvbox_material_palette    = "material" -- or "mix", "original"
vim.cmd("colorscheme gruvbox-material")

vim.lsp.config('roslyn_ls', {
  cmd = {
    'dotnet',
    vim.fn.expand('~/.local/share/lsp_servers/roslyn/content/LanguageServer/osx-arm64/Microsoft.CodeAnalysis.LanguageServer.dll'),
    '--logLevel',
    'Information',
    '--extensionLogDirectory',
    vim.fs.joinpath((vim.uv or vim.loop).os_tmpdir(), 'roslyn_ls/logs'),
    '--stdio',
  },
})

vim.lsp.enable('roslyn_ls')

require('render-markdown').setup({})
