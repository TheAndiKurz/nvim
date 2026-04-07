return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local parsers = {
                "typescript",
                "go",
                "nu",
                "bash",
                "vimdoc",
                "lua",
            }

            require("nvim-treesitter").install(parsers)

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        after = "nvim-treesitter",
        config = function()
            require('treesitter-context').setup {
                enable = true,            -- Enable this plugin
                multiwindow = false,      -- Enable multiwindow support.
                max_lines = 0,            -- How many lines the window should span.
                min_window_height = 0,    -- Minimum editor window height to enable context.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded.
                mode = 'cursor',          -- Line used to calculate context.
                separator = nil,
                zindex = 20,              -- The Z-index of the context window
                on_attach = nil,          -- return false to disable attaching
            }
        end
    },
}
