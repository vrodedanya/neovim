vim.opt.termguicolors = true

function SetColor(color)
    color = color or "kanagawa-wave"
    vim.cmd.colorscheme(color)
end
SetColor()
