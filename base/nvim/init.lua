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
'https://github.com/neovim/nvim-lspconfig',
'https://github.com/nvim-mini/mini.pick'
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.cmd("set completeopt+=noselect")

require 'mini.pick'.setup()
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

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

vim.lsp.enable({"lua_ls", "roslyn_ls"})

require('render-markdown').setup({})

vim.g.gruvbox_material_background = "medium"   -- or "soft", "hard"
vim.g.gruvbox_material_palette    = "material" -- or "mix", "original"
vim.cmd("colorscheme gruvbox-material")

