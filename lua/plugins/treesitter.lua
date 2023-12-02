require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c", "lua", "vim", "vimdoc", "cpp", "cmake", "python", "bash",
        "dockerfile", "rust"
    },
    sync_install = false,
    auto_install = true,
    highlight = {enable = true}
}
