vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "*.launch" },
    callback = function ()
        vim.cmd("setfiletype xml")
    end
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = { "*.vert", "*.frag" },
    callback = function ()
        vim.cmd("setfiletype glsl")
    end
})
