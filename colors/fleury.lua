-- fleury.lua
-- The fleury color theme for Neovim
-- Converted from the original Emacs theme by Shams Parvez Arka

vim.cmd("clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "fleury"

-- Color palette
local c = {
    rich_black                  = "#020202",
    light_bronze                = "#b99468",
    charcoal_gray               = "#212121",
    charcoal_gray_lite          = "#1e1e1e",
    gunmetal_blue               = "#303040",
    dark_slate                  = "#222425",
    amber_gold                  = "#fcaa05",
    medium_gray                 = "#404040",
    jet_black                   = "#121212",
    dim_gray                    = "#666666",
    goldenrod                   = "#f0c674",
    bright_orange               = "#ffaa00",
    dusty_rose                  = "#dc7575",
    sunflower_yellow            = "#edb211",
    burnt_orange                = "#de451f",
    sky_blue                    = "#2895c7",
    sky_blue_lite               = "#2f2f38",
    bright_red                  = "#ff0000",
    fresh_green                 = "#66bc11",
    lime_green                  = "#003939",
    vivid_vermilion             = "#f0500c",
    golden_yellow               = "#f0bb0c",
    pure_black                  = "#000000",
    aqua_ice                    = "#8ffff2",
    dusty_sage                  = "#9ba290",
    coffee_brown                = "#63523d",
    mode_line_foreground_active = "#e7aa4d",
    mode_line_background_active = "#1a120b",
    mode_line_border            = "#161616",
}

-- Highlight groups mapping
local highlights = {
    -- UI Elements
    Normal                     = { fg = c.light_bronze, bg = c.rich_black },
    NormalFloat                = { fg = c.light_bronze, bg = c.jet_black },
    Cursor                     = { bg = c.fresh_green },
    TermCursor                 = { bg = c.fresh_green },
    Visual                     = { bg = c.lime_green },
    CursorLine                 = { bg = c.charcoal_gray_lite },
    CursorColumn               = { bg = c.charcoal_gray_lite },
    ColorColumn                = { bg = c.charcoal_gray_lite },
    LineNr                     = { fg = c.medium_gray, bg = c.rich_black },
    CursorLineNr               = { fg = c.light_bronze, bg = c.charcoal_gray_lite },
    SignColumn                 = { bg = c.rich_black },
    WinSeparator               = { fg = c.light_bronze },            -- Replaces window-divider
    VertSplit                  = { fg = c.light_bronze },
    MsgArea                    = { fg = c.amber_gold, bold = true }, -- Minibuffer prompt equivalent

    -- Mode Line / Status Line
    StatusLine                 = { fg = c.mode_line_foreground_active, bg = c.mode_line_background_active },
    StatusLineNC               = { fg = c.mode_line_foreground_active, bg = c.rich_black },
    TabLine                    = { fg = c.mode_line_foreground_active, bg = c.rich_black },
    TabLineSel                 = { fg = c.mode_line_foreground_active, bg = c.mode_line_background_active },
    TabLineFill                = { bg = c.rich_black },

    -- Search & Match
    Search                     = { fg = c.pure_black, bg = c.vivid_vermilion }, -- isearch
    IncSearch                  = { fg = c.pure_black, bg = c.golden_yellow },   -- match / lazy-highlight
    MatchParen                 = { bg = c.sky_blue_lite },                      -- show-paren-match

    -- Popup Menu (Tooltip equivalent)
    Pmenu                      = { fg = c.amber_gold, bg = c.coffee_brown },
    PmenuSel                   = { fg = c.pure_black, bg = c.amber_gold },
    PmenuSbar                  = { bg = c.charcoal_gray },
    PmenuThumb                 = { bg = c.light_bronze },

    -- Standard Syntax (fallback for non-treesitter)
    Comment                    = { fg = c.dim_gray },
    Keyword                    = { fg = c.goldenrod },
    Statement                  = { fg = c.goldenrod },
    Conditional                = { fg = c.goldenrod },
    Repeat                     = { fg = c.goldenrod },
    String                     = { fg = c.bright_orange },
    Constant                   = { fg = c.bright_orange },
    Number                     = { fg = c.bright_orange },
    Boolean                    = { fg = c.bright_orange },
    Function                   = { fg = c.burnt_orange },
    Identifier                 = { fg = c.light_bronze }, -- variable-name-face
    Type                       = { fg = c.sunflower_yellow },
    PreProc                    = { fg = c.dusty_rose },
    Special                    = { fg = c.dusty_rose }, -- builtin/constant equivalents
    Operator                   = { fg = c.light_bronze },
    Error                      = { fg = c.bright_red, bold = true },
    Todo                       = { fg = c.amber_gold, bold = true, bg = c.charcoal_gray },

    -- Diagnostics & Compilation
    DiagnosticError            = { fg = c.bright_red },
    DiagnosticWarn             = { fg = c.coffee_brown, bold = true },
    DiagnosticInfo             = { fg = c.fresh_green },
    DiagnosticHint             = { fg = c.sky_blue },
    DiagnosticUnderlineError   = { sp = c.bright_red, undercurl = true },
    DiagnosticUnderlineWarn    = { sp = c.coffee_brown, undercurl = true },

    -- Treesitter specific adjustments
    ["@variable"]              = { fg = c.sky_blue },    -- font-lock-variable-use-face
    ["@variable.builtin"]      = { fg = c.dusty_rose },  -- font-lock-builtin-face
    ["@function.builtin"]      = { fg = c.dusty_rose },
    ["@comment.documentation"] = { fg = c.fresh_green }, -- font-lock-doc-face
    ["@keyword.directive"]     = { fg = c.dusty_rose },  -- font-lock-preprocessor-face
    ["@module"]                = { fg = c.sunflower_yellow },
    ["@property"]              = { fg = c.light_bronze },
}

for group, properties in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, properties)
end
