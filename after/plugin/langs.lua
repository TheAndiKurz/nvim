-- go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- zig
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.zig",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- odin
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "*.odin" },
    callback = function ()
        vim.opt.expandtab = false
    end
})

-- typescript
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = {"*.ts", "*.tsx"},
--   command = "!biome check --write %",
-- })
