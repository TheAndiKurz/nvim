local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fe', builtin.find_files, {})
vim.keymap.set('n', '<leader>fge', builtin.git_files, {})

vim.keymap.set('n', '<leader>se', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
