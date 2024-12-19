vim.g.mapleader = " "

-- open explorer with <leader>e
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<leader>hd", ":Sex<CR>")
vim.keymap.set("n", "<leader>vd", ":Vex<CR>")

-- close the current buffer with <C-d>
vim.keymap.set("n", "<C-d>", ":bd<CR>")

-- open the command history with <leader>.
vim.keymap.set("n", "<leader>.", "q:")

-- search and replace word under cursor in file
vim.keymap.set("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")
