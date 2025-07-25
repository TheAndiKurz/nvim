-- install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute("!git clone git@github.com:wbthomason/packer.nvim " .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    use {
        'nvim-telescope/telescope.nvim', branch = "0.1.x",
        requires = { {'nvim-lua/plenary.nvim'} }
    }



    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-context',
    }

    use("nvim-treesitter/playground")

    use {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use("mbbill/undotree")

    use("tpope/vim-fugitive")

    use("fladson/vim-kitty")

    use {
        'neovim/nvim-lspconfig',
        requires = {
            {"j-hui/fidget.nvim"},

            -- LSP Support
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use "lukas-reineke/indent-blankline.nvim"

    use {
        "numToStr/Comment.nvim",
        config = function ()
            require('Comment').setup()
        end
    }

    -- git
    use "lewis6991/gitsigns.nvim"

    -- themes
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use({
        'morhetz/gruvbox',
        as = 'gruvbox',
    })

    -- statusbar
    use "nvim-lualine/lualine.nvim"

    -- debugger
    use {
        "mfussenegger/nvim-dap",
        requires = {
            {"nvim-neotest/nvim-nio"},
            {"rcarriga/nvim-dap-ui"},
            {"theHamsta/nvim-dap-virtual-text"},
            {"leoluz/nvim-dap-go"}
        },
    }
end)
