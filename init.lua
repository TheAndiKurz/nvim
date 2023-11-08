-- install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute("!git clone git@github.com:wbthomason/packer.nvim " .. install_path)
    vim.cmd [[packadd packer.nvim]]
end


require("kurz")
