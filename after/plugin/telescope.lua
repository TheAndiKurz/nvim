local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', function ()
    builtin.buffers({ sort_lastused = true, sort_mru = true })
end)

vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
