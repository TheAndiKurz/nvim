vim.g.mapleader = " "

-- open explorer with <leader>e
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<leader>hd", ":Sex<CR>")
vim.keymap.set("n", "<leader>vd", ":Vex<CR>")

-- open termianl in a split window with <leader>t
vim.keymap.set("n", "<leader>ht", ":sp +terminal<CR>")
vim.keymap.set("n", "<leader>vt", ":vs +terminal<CR>")

-- leave terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- close the current buffer with <C-d>
vim.keymap.set("n", "<C-d>", ":bd<CR>")

-- open the command history with <leader>.
vim.keymap.set("n", "<leader>.", "q:")

-- search and replace word under cursor in file
vim.keymap.set("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")
