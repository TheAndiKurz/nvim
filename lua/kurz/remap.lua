vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- open termianl in a split window with <leader>tt
vim.keymap.set("n", "<leader>tt", ":vs +terminal<CR>")

-- leave terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- close the current buffer with <C-d>
vim.keymap.set("n", "<C-d>", ":bd<CR>")
