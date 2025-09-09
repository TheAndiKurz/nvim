-- NOTE: test note
-- NOTE(andik): test note
-- TODO: test todo
-- TODO(andik): test todo
-- FIX: text fix
-- FIX(andik): text fix

local colors = {
    info_text = "#000000",
    info = "#00FFFF",
    warn_text = "#000000",
    warn = "#FF8800",
    error_text = "#000000",
    error = "#FF0000",
}

local keywords = {
    { name = "TODO", keys = { "TODO%(andik%)", "TODO" }, colors = { bg = colors.info, fg = colors.info_text, ctx = colors.info } },
    { name = "NOTE", keys = { "NOTE%(andik%)", "NOTE" }, colors = { bg = colors.warn, fg = colors.warn_text, ctx = colors.warn } },
    { name = "FIX", keys = { "FIX%(andik%)", "FIX" }, colors = { bg = colors.error, fg = colors.error_text, ctx = colors.error } },
}

for _, keyword in ipairs(keywords) do
    vim.api.nvim_set_hl(0, keyword.name, { bg = keyword.colors.bg, fg = keyword.colors.fg, bold = true })
    if keyword.colors.ctx then
        vim.api.nvim_set_hl(0, keyword.name .. "_comment", { fg = keyword.colors.ctx })
    end
end


local function highlight_todos()
    local hl_ns = vim.api.nvim_create_namespace('TodoHighlightNS')

    vim.api.nvim_create_augroup("TodoHighlightGroup", { clear = true })

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "BufWritePost", "FileType"}, {
        group = "TodoHighlightGroup",
        pattern = "*",
        callback = function()
            vim.api.nvim_buf_clear_namespace(0, hl_ns, 0, -1)

            local ok, parser = pcall(vim.treesitter.get_parser, nil, vim.bo.filetype)
            if not ok or not parser then
                return
            end

            local query = vim.treesitter.query.parse(vim.bo.filetype, [[
            (comment) @comment
            ]])

            local tree = parser:parse()[1]

            for _, node in query:iter_captures(tree:root(), 0) do
                local comment_text = vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf())

                for _, keyword in ipairs(keywords) do
                    local start_idx, end_idx
                    for _, key in ipairs(keyword.keys) do
                        start_idx, end_idx = string.find(comment_text, key)
                        if start_idx and end_idx then
                            break
                        end
                    end

                    if start_idx and end_idx then
                        local start_row, start_col, end_row, end_col = node:range()

                        vim.api.nvim_buf_set_extmark(0, hl_ns, start_row, start_col, {
                            end_row = end_row,
                            end_col = end_col,
                            hl_group = keyword.name .. "_comment"
                        })
                        vim.api.nvim_buf_set_extmark(0, hl_ns, start_row, start_col + start_idx - 1, {
                            end_row = end_row,
                            end_col = start_col + end_idx,
                            hl_group = keyword.name
                        })
                    end
                end
            end
        end,
    })
end

highlight_todos()
