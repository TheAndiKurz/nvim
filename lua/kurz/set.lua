vim.opt.guicursor = "n-v:block,i:ver25,r:hor25"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.nu = true
vim.opt.relativenumber = true

if string.match(vim.o.shell, "nu$") then
    vim.opt.shellcmdflag = "-l -c"
    vim.opt.shellredir = "out+err> %s"
    vim.opt.shellpipe = "out+err> %s"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.winborder = "rounded"

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

local home = os.getenv("HOME")

-- windows settings
if home == nil then
    home = os.getenv("USERPROFILE")
    vim.opt.shell = "pwsh.exe"
end

vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font:h13"
    vim.g.neovide_cursor_cell_color_fallback = true
end
