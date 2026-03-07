return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim" },

        -- LSP Support
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",
                "lua_ls",
                "ts_ls",
                "ols",
                "zls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    }
                                },
                            }
                        }
                    }
                end,
            }
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(e)
                local opts = { buffer = e.buf }
                local builtin = require "telescope.builtin"
                vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
                vim.keymap.set("n", "gr", builtin.lsp_references, opts)
                vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
                vim.keymap.set("n", "<C-s>", builtin.lsp_document_symbols, opts)
                vim.keymap.set("n", "<C-S-s>", builtin.lsp_workspace_symbols, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>d", builtin.diagnostics, opts)
                vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "F2", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

                vim.api.nvim_create_autocmd("BufWritePre", {
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end,
}
