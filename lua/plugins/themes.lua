return {
    {
        "Shatur/neovim-ayu",
        dependencies = { "nvim-lualine/lualine.nvim", },
        name = "ayu",
        config = function()
            require('ayu').setup({
                mirage = true,
                terminal = true,
                overrides = {},
            })
            require('lualine').setup({
                options = {
                    theme = 'ayu',
                },
            })
            require('ayu').colorscheme()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    -- {
    --     "morhetz/gruvbox",
    --     name = "gruvbox",
    -- },
}
