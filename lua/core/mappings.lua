vim.g.mapleader = " "

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree filesystem toggle<CR>')
vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')

-- EasyMotion
vim.keymap.set('n', '<leader>;', '<Plug>(easymotion-bd-f)')
vim.keymap.set('n', "<leader>db", ":DapToggleBreakpoint <CR>")
vim.keymap.set('n', "<leader>dr", ":DapContinue <CR>")

-- CMake
vim.keymap.set('n', "<leader>5", ":CMakeRun <CR>")
vim.keymap.set('n', "<leader>6", ":CMakeDebug <CR>")
vim.keymap.set('n', "<leader>4", ":CMakeBuild <CR>")

-- Clangd
vim.keymap.set('n', "<leader>o", ":ClangdSwitchSourceHeader <CR>")

-- Navbuddy
vim.keymap.set('n', "<leader>n", ":Navbuddy <CR>")
