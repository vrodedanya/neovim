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
    }, {'nvim-treesitter/nvim-treesitter'}, {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {"SmiteshP/nvim-navic", "MunifTanjim/nui.nvim"},
                opts = {lsp = {auto_attach = true}}
            }
        }
    }, {'rebelot/kanagawa.nvim'}, {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-cmdline'}, {'hrsh7th/vim-vsnip'},
    {'hrsh7th/nvim-cmp'}, {"williamboman/mason.nvim"}, {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {'jose-elias-alvarez/null-ls.nvim'}, {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    }, {'easymotion/vim-easymotion'}, {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }, {'lewis6991/gitsigns.nvim'}, {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false
    }, {'nvim-lualine/lualine.nvim'},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'mfussenegger/nvim-dap'},
    {"jay-babu/mason-nvim-dap.nvim", opts = {handlers = {}}}, {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }, {'Civitasv/cmake-tools.nvim'}, {'mg979/vim-visual-multi'}, {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"
        }
    }, {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }, {'jamestthompson3/nvim-remote-containers'}
})
