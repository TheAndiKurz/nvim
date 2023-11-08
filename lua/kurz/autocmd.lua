vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "*.launch" },
    callback = function ()
        vim.cmd("setfiletype xml")
    end
})
