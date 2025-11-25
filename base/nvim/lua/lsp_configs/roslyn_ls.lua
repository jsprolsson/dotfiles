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

