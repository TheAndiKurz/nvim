return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')

        local function find_files(opts)
            builtin.find_files(opts)
        end

        local function git_files(opts)
            builtin.git_files(opts)
        end

        local function find_buffers(opts)
            builtin.buffers(opts, {
                sort_lastused = true,
            })
        end

        local function grep_string()
            local search = vim.fn.input("Grep > ")

            builtin.grep_string({ search = search })
        end

        vim.keymap.set('n', '<C-p>', find_files)
        vim.keymap.set('n', '<C-b>', find_buffers)
        vim.keymap.set('n', '<C-g>', git_files)
        vim.keymap.set('n', '<leader>/', grep_string)
    end
}
