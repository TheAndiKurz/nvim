vim.pack.add {
    -- deps
    "https://github.com/nvim-lua/plenary.nvim",

    -- completions
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/L3MON4D3/LuaSnip",

    -- comment
    "https://github.com/numToStr/Comment.nvim",

    -- compile mode
    { src = "https://github.com/ej-shafran/compile-mode.nvim", version = "latest" },

    -- git
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",

    -- harpoon
    { src = "https://github.com/ThePrimeagen/harpoon",         version = "harpoon2" },

    -- lsp
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/j-hui/fidget.nvim",

    -- oil
    "https://github.com/stevearc/oil.nvim",

    -- status bar
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",

    -- telescope
    "https://github.com/nvim-telescope/telescope.nvim",

    -- themes
    "https://github.com/rose-pine/neovim",

    -- treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
}

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

-- options
vim.opt.guicursor = "n-v:block,i:ver25,r:hor25"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.nu = true
vim.opt.relativenumber = true

if string.match(vim.o.shell, "nu$") then
    vim.opt.shellcmdflag = "-l -c"
    vim.opt.shellredir = "out+err> %s"
    vim.opt.shellpipe = "out+err> %s"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.winborder = ""

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

local home = os.getenv("HOME")

-- windows settings
if home == nil then
    home = os.getenv("USERPROFILE")
    vim.opt.shell = "pwsh.exe"
end

vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- neovide config
if vim.g.neovide then
    vim.o.guifont = "Hack:h13"
    vim.g.neovide_cursor_cell_color_fallback = true
end

-- remaps
vim.g.mapleader = " "

-- open explorer with <leader>e
vim.keymap.set("n", "<leader>e", vim.cmd.Oil)

-- use system clipboard always
vim.keymap.set({ "n", "v" }, "y", "\"+y")
vim.keymap.set("n", "yy", "\"+yy")
vim.keymap.set("n", "Y", "\"+Y")

vim.keymap.set({ "n", "v" }, "p", "\"+p")
vim.keymap.set({ "n", "v" }, "P", "\"+P")

vim.keymap.set({ "n", "v" }, "d", "\"+d")
vim.keymap.set("n", "dd", "\"+dd")
vim.keymap.set("n", "D", "\"+D")

-- completions
local ls = require("luasnip")
ls.config.set_config({
    enable_autosnippets = true,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-m>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" }
    })
})

-- compile mode

---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
    -- The string to show in the compile prompt as a default.
    -- :h compile_mode.default_command
    default_command = {
        zig = "zig build",
        odin = "odin build .",
    },
    -- Use `baleia` for parsing ANSI escape codes in the output.
    -- :h compile_mode.baleia_setup
    baleia_setup = true,
    -- Expand commands, like `:!` (e.g. `:Compile echo %`)
    -- :h compile_mode.bang_expansion
    bang_expansion = true,
    -- Configure additional entering/leaving directory regexes.
    -- :h compile-mode.directory_change_matchers
    directory_change_matchers = {},
    -- Configure additional error regexes.
    -- :h compile-mode-errors
    error_regexp_table = {},
    -- List of filename regexes to ignore errors from.
    -- :h compile-mode.error_ignore_file_list
    error_ignore_file_list = {},
    -- The minimum error level to jump to.
    -- :h compile-mode.error_threshold
    error_threshold = require("compile-mode").level.WARNING,
    -- Automatically jump to the first error.
    -- :h compile-mode.auto_jump_to_first_error
    auto_jump_to_first_error = true,
    -- How long to highlight an error's location when jumping to it.
    -- :h compile-mode.error_locus_highlight
    error_locus_highlight = 500,
    -- Use Neovim diagnostics instead of opening the compilation buffer.
    -- :h compile-mode.use_diagnostics
    use_diagnostics = false,
    -- Default to calling `:Compile` for `:Recompile`
    -- when there's no previous command.
    -- :h compile-mode.recompile_no_fail
    recompile_no_fail = true,
    -- Ask to save unsaved buffers before compiling.
    -- :h compile-mode.ask_about_save
    ask_about_save = true,
    -- Ask to interrupt already running commands.
    -- :h compile-mode.ask_to_interrupt
    ask_to_interrupt = true,
    -- The name for the compilation buffer.
    -- :h compile-mode.buffer_name
    buffer_name = "*compilation*",
    -- The format for the time information
    -- at the top of the compilation buffer
    -- :h compile-mode.time_format
    time_format = "%a %b %e %H:%M:%S",
    -- List of regexes to hide from the output.
    -- :h compile-mode.hidden_output
    hidden_output = {},
    -- A table of environment variables to pass to commands.
    -- :h compile-mode.environment
    environment = nil,
    -- Clear all environment variables for each command.
    -- :h compile-mode.clear_environment
    clear_environment = false,
    -- Fix compilation for plugins like `nvim-cmp`.
    -- :h compile-mode.input_word_completion
    input_word_completion = true,
    -- Hide the compliation buffer.
    -- :h compile-mode.hidden_buffer
    hidden_buffer = false,
    -- Automatically focus the compilation buffer.
    -- :h compile-mode.focus_compilation_buffer
    focus_compilation_buffer = true,
    -- Automatically move the cursor to the end of the compilation buffer.
    -- :h compile-mode.auto_scroll
    auto_scroll = true,
    -- Jump back past the end/beginning of the errors
    -- with `:NextError`/`:PrevError`
    -- :h compile-mode.use_circular_error_navigation
    use_circular_error_navigation = false,
    -- Print debug information.
    -- :h compile-mode.debug
    debug = false,
    -- Use a pseudo terminal for command execution.
    -- :h compile-mode.use_pseudo_terminal
    use_pseudo_terminal = false,
}

-- theme
vim.cmd.colorscheme("rose-pine-moon")

-- oil
require("oil").setup {
    keymaps = { ['<C-h>'] = false },
    columns = { 'size', 'mtime' },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
}

-- status bar
require("lualine").setup()

-- telescope
local builtin = require('telescope.builtin')

local function find_files(opts)
    builtin.find_files(opts)
end

local function git_files(opts)
    builtin.git_files(opts)
end

local function find_buffers(opts)
    builtin.buffers(opts, {
        sort_lastused = true,
    })
end

local function grep_string()
    local search = vim.fn.input("Grep > ")

    builtin.grep_string({ search = search })
end

vim.keymap.set('n', '<C-p>', find_files)
vim.keymap.set('n', '<C-b>', find_buffers)
vim.keymap.set('n', '<C-g>', git_files)
vim.keymap.set('n', '<leader>/', grep_string)

-- treesitter
local parsers = {
    "typescript",
    "go",
    "nu",
    "bash",
    "vimdoc",
    "lua",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

require("treesitter-context").setup {
    enable = true,            -- Enable this plugin
    multiwindow = false,      -- Enable multiwindow support.
    max_lines = 0,            -- How many lines the window should span.
    min_window_height = 0,    -- Minimum editor window height to enable context.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded.
    mode = 'cursor',          -- Line used to calculate context.
    separator = nil,
    zindex = 20,              -- The Z-index of the context window
    on_attach = nil,          -- return false to disable attaching
}

-- undotree
vim.keymap.set("n", "<C-u>", vim.cmd.Undotree)

-- harpoon
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-ö>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- git signs
require("gitsigns").setup {
    signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}

-- comment
require("Comment").setup()

-- lsp
require("fidget").setup({})
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

vim.lsp.config("*", {
    capabilities = capabilities,
})
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                }
            },
        }
    }
})

local enabled_lsps = { "tinymist", "lua_ls", "clangd", "gopls", "ts_ls", "ols", "zls" }
for _, lsp in ipairs(enabled_lsps) do
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.document_symbol, opts)
        vim.keymap.set("n", "<C-S-s>", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.workspace_diagnostics, opts)
        vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        local ft = vim.bo[e.buf].filetype
        if ft == "typescript" or ft == "typescriptreact" then
            return -- no format for those
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = e.buf,
            callback = function()
                vim.lsp.buf.format({ async = false })

                if ft == "go" then
                    vim.lsp.buf.code_action({
                        context = {
                            only = { "source.organizeImports" },
                            diagnostics = {},
                            triggerKind = 2,
                        },
                        apply = true
                    })
                end
            end,
        })
    end
})

vim.diagnostic.config({
    virtual_text = true
})
