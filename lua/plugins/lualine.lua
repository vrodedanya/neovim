package.path = package.path .. ";../?.lua"
local lualine = require('lualine')
local cmake = require("cmake-tools")
local icons = require("core.icons")

local config = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {statusline = {}, winbar = {}},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {statusline = 1000, tabline = 1000, winbar = 1000}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
            'searchcount', 'selectioncount', 'encoding', 'fileformat',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

local function total_lines() return "total: " .. vim.fn.line('$'); end

ins_left {
    function()
        local c_preset = cmake.get_configure_preset()
        return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
    end,
    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then
                vim.cmd("CMakeSelectConfigurePreset")
            end
        end
    end
}

ins_left {
    function()
        local type = cmake.get_build_type()
        return "CMake: [" .. (type and type or "") .. "]"
    end,
    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then vim.cmd("CMakeSelectBuildType") end
        end
    end
}

ins_left {
    function()
        local kit = cmake.get_kit()
        return "[" .. (kit and kit or "X") .. "]"
    end,
    icon = icons.ui.Pencil,
    cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then vim.cmd("CMakeSelectKit") end
        end
    end
}

ins_left {
    function() return "Build" end,
    icon = icons.ui.Gear,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if (n == 1) then if (mouse == "l") then vim.cmd("CMakeBuild") end end
    end
}

ins_left {
    function()
        local b_preset = cmake.get_build_preset()
        return "[" .. (b_preset and b_preset or "X") .. "]"
    end,
    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then vim.cmd("CMakeSelectBuildPreset") end
        end
    end
}

ins_left {
    function()
        local b_target = cmake.get_build_target()
        return "[" .. (b_target and b_target or "X") .. "]"
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then vim.cmd("CMakeSelectBuildTarget") end
        end
    end
}

ins_left {
    function() return icons.ui.Debug end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if (n == 1) then if (mouse == "l") then vim.cmd("CMakeDebug") end end
    end
}

ins_left {
    function() return icons.ui.Run end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if (n == 1) then if (mouse == "l") then vim.cmd("CMakeRun") end end
    end
}

ins_left {
    function()
        local l_target = cmake.get_launch_target()
        return "[" .. (l_target and l_target or "X") .. "]"
    end,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if (n == 1) then
            if (mouse == "l") then vim.cmd("CMakeSelectLaunchTarget") end
        end
    end
}

ins_right {
    -- filesize component
    "filesize",
    cond = conditions.buffer_not_empty
}
ins_right {total_lines}

lualine.setup(config)
