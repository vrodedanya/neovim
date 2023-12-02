local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    }, {'nvim-treesitter/nvim-treesitter'}, {'neovim/nvim-lspconfig'},
    {'rebelot/kanagawa.nvim'}, {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/vim-vsnip'}, {'hrsh7th/nvim-cmp'},
    {"williamboman/mason.nvim"}, {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {'jose-elias-alvarez/null-ls.nvim'}, {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }
})
