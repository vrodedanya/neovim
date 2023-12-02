local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.codespell,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.gccdiag,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.todo_comments,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.diagnostics.hadolint
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(newClient)
                            return newClient.name == "null-ls"

                        end
                    })
                end
            })
        end
    end
})
