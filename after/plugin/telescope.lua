local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local function find_files(opts)
    builtin.find_files(themes.get_ivy(opts))
end

local function git_files(opts)
    builtin.git_files(themes.get_ivy(opts))
end

local function grep_string()
    local search = vim.fn.input("Grep > ")

    builtin.grep_string(themes.get_ivy({ search = search }))
end

vim.keymap.set('n', '<leader>f', find_files)
vim.keymap.set('n', '<leader>g', git_files)
vim.keymap.set('n', '<leader>/', grep_string)
