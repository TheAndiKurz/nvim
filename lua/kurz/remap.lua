vim.g.mapleader = " "

-- open explorer with <leader>e
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>he", ":Sex<CR>")
vim.keymap.set("n", "<leader>ve", ":Vex<CR>")

-- open the command history with <leader>.
vim.keymap.set("n", "<leader>.", "q:")

-- search and replace word under cursor in file
vim.keymap.set("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

-- Yanking
vim.keymap.set({ 'n', 'v' }, 'y', '"+y')
vim.keymap.set('n', 'yy', '"+yy')
vim.keymap.set('n', 'Y', '"+Y')

-- Pasting
vim.keymap.set({ 'n', 'v' }, 'p', '"+p')
vim.keymap.set({ 'n', 'v' }, 'P', '"+P')

-- Deleting (I really dislike this more times then I like it...)
-- vim.keymap.set({'n', 'v'}, 'd', '"+d')
