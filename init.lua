-- Basic
require('core.plugins')
require('core.mappings')
require('core.colors')
require('core.configs')
-- Plugins
require('plugins.neotree')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.mason')
require('plugins.telescope')
require('plugins.null_ls')
require('plugins.comment')
require('plugins.lualine')
require('plugins.toggleterm')
require('plugins.dap')
require('plugins.cmake_tools')
require('plugins.navbuddy')
require('plugins.refactoring')

-- LSP
require('lsp.clangd')
require('lsp.lua_ls')
