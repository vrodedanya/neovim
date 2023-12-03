require("cmake-tools").setup {
    -- this is used to specify cmake command path
    cmake_command = "cmake",
    -- auto generate when save CMakeLists.txt
    cmake_regenerate_on_save = true,
    -- this will be passed when invoke `CMakeGenerate`
    cmake_generate_options = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=1", "-G \"Ninja\""
    },
    -- this will be passed when invoke `CMakeBuild`
    cmake_build_options = {"-j"},
    -- support macro expansion:
    --       ${kit}
    --       ${kitGenerator}
    --       ${variant:xx}
    -- this is used to specify generate directory for cmake, allows macro expansion
    cmake_build_directory = "build/${variant:buildType}",
    -- this will automatically make a soft link from compile commands file to project root dir
    cmake_soft_link_compile_commands = true,
    -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
    cmake_compile_commands_from_lsp = false,
    -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
    cmake_kits_path = nil,
    cmake_variants_message = {
        -- whether to show short message
        short = {show = true},
        -- whether to show long message
        long = {show = true, max_length = 40}
    },
    -- debug settings for cmake
    cmake_dap_configuration = {
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal"
    },
    -- executor to use
    cmake_executor = {
        -- name of the executor ,
        name = "quickfix",
        -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
        opts = {},
        -- a list of default and possible values for executors
        default_opts = {
            quickfix = {
                -- "always", "only_on_error"
                show = "always",
                -- "bottom", "top" 
                position = "belowright",
                size = 10
            },
            overseer = {
                -- options to pass into the `overseer.new_task` command
                new_task_opts = {},
                -- a function that gets overseer.Task when it is created, before calling `task:start`
                on_new_task = function(task) end
            },
            -- terminal executor uses the values in cmake_terminal
            terminal = {}
        }
    },
    cmake_terminal = {
        name = "terminal",
        opts = {
            name = "Main Terminal",
            -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            prefix_name = "[CMakeTools]: ",

            split_direction = "horizontal",
            split_size = 11,

            -- Window handling
            -- Single viewport, multiple windows
            single_terminal_per_instance = true,
            -- Single viewport per tab
            single_terminal_per_tab = true,
            -- Static location of the viewport if available
            keep_terminal_static_location = true,

            -- Running Tasks
            -- If you want to enter terminal with :startinsert upon using :CMakeRun
            start_insert_in_launch_task = false,
            -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
            start_insert_in_other_tasks = false,
            -- Focus on cmake terminal when cmake task is launched. Only used if executor is terminal.
            focus_on_main_terminal = false,
            -- Focus on cmake launch terminal when executable target in launched.
            focus_on_launch_terminal = false
        }
    },
    cmake_notifications = {
        -- show cmake execution progress in nvim-notify
        enabled = true,
        -- icons used for progress display
        spinner = {
            "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"
        },
        -- how often to iterate icons
        refresh_rate_ms = 100
    }
}
