local lspconfig = require('lspconfig')
local navbuddy = require('nvim-navbuddy')

lspconfig.clangd.setup {
    cmd = {
        "clangd", "--background-index", "--clangd-tidy",
        "--header-insertion=never", "--rename-file-limit=0",
        "--limit-results=0", "--limit-references=0", "--all-scopes-completion"
    },
    on_attach = function(client, bufnr) navbuddy.attach(client, bufnr) end
}
