return {
    {
        'Treeniks/isabelle-lsp.nvim',
        config = function()
            vim.filetype.add({
                extension = {
                    thy = 'isabelle',
                },
            })

            local isa_lsp = require('isabelle-lsp')
            isa_lsp.setup({
                isabelle_path = "/home/andik/git/mirror-isabelle/bin/isabelle",
                vsplit = true,
                hl_group_map = {
                    ['background_unprocessed1'] = false,
                    ['background_running1'] = false,
                    ['background_canceled'] = false,
                    ['background_bad'] = false,
                    ['background_intensify'] = false,
                    ['background_markdown_bullet1'] = 'markdownH1',
                    ['background_markdown_bullet2'] = 'markdownH2',
                    ['background_markdown_bullet3'] = 'markdownH3',
                    ['background_markdown_bullet4'] = 'markdownH4',
                    ['foreground_quoted'] = false,
                    ['text_main'] = 'Normal',
                    ['text_quasi_keyword'] = 'Keyword',
                    ['text_free'] = 'Function',
                    ['text_bound'] = 'Identifier',
                    ['text_inner_numeral'] = false,
                    ['text_inner_quoted'] = 'String',
                    ['text_comment1'] = 'Comment',
                    ['text_comment2'] = false, -- seems to not exist in the LSP
                    ['text_comment3'] = false,
                    ['text_dynamic'] = false,
                    ['text_class_parameter'] = false,
                    ['text_antiquote'] = 'Comment',
                    ['text_raw_text'] = 'Comment',
                    ['text_plain_text'] = 'String',
                    ['text_overview_unprocessed'] = false,
                    ['text_overview_running'] = 'Bold',
                    ['text_overview_error'] = false,
                    ['text_overview_warning'] = false,
                    ['dotted_writeln'] = false,
                    ['dotted_warning'] = 'DiagnosticWarn',
                    ['dotted_information'] = false,
                    ['spell_checker'] = 'Underlined',
                    ['text_inner_cartouche'] = false,
                    ['text_var'] = 'Function',
                    ['text_skolem'] = 'Identifier',
                    ['text_tvar'] = 'Type',
                    ['text_tfree'] = 'Type',
                    ['text_operator'] = 'Function',
                    ['text_improper'] = 'Keyword',
                    ['text_keyword3'] = 'Keyword',
                    ['text_keyword2'] = 'Keyword',
                    ['text_keyword1'] = 'Keyword',
                    ['foreground_antiquoted'] = false,
                },
                unicode_symbols_output = true,
                unicode_symbols_edits = true,
                verbose = true,
            })

            vim.lsp.enable("isabelle")
        end,
    },
    -- {
    --     "cplaursen/vim-isabelle",
    --     dependencies = { "L3MON4D3/LuaSnip" },
    --     config = function()
    --         local ls = require("luasnip")
    --         local s = ls.snippet
    --         local t = ls.text_node

    --         ls.config.set_config({
    --             enable_autosnippets = true,
    --         })

    --         -- A dictionary of your Isabelle abbreviations mapping to their full symbols
    --         local isabelle_completions = {
    --             ["\\lam"] = "\\<lambda>",
    --             ["\\Ra"]  = "\\<Rightarrow>",
    --             ["\\La"]  = "\\<Leftarrow>",
    --             ["\\lra"] = "\\<longleftrightarrow>",
    --             ["\\all"] = "\\<forall>",
    --             ["\\ex"]  = "\\<exists>",
    --             ["\\and"] = "\\<and>",
    --             ["\\or"]  = "\\<or>",
    --             ["\\not"] = "\\<not>",
    --             ["\\in"]  = "\\<in>",
    --             ["\\un"]  = "\\<union>",
    --             ["\\int"] = "\\<inter>",
    --             ["\\sub"] = "\\<subseteq>",
    --             ["\\le"]  = "\\<le>",
    --             ["\\ge"]  = "\\<le>",
    --         }
    --         local isabelle_autocomplete = {
    --             ["=>"]  = "\\<Rightarrow>",
    --             ["-->"] = "\\<longleftrightarrow>",
    --             ["<="]  = "\\<le>",
    --             [">="]  = "\\<ge>",
    --         }

    --         local isabelle_snippets = {}
    --         -- Loop through the table and create a snippet for each one
    --         for trigger, replacement in pairs(isabelle_completions) do
    --             table.insert(
    --                 isabelle_snippets,
    --                 s(trigger, { t(replacement) })
    --             )
    --         end
    --         for trigger, replacement in pairs(isabelle_autocomplete) do
    --             table.insert(
    --                 isabelle_snippets,
    --                 s({ trig = trigger, snippetType = "autosnippet" }, { t(replacement) })
    --             )
    --         end

    --         -- Register the snippets specifically for the "isabelle" filetype
    --         ls.add_snippets("isabelle", isabelle_snippets)
    --     end,
    -- }
}
