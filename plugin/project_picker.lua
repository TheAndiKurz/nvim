local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function get_git_repos()
    local base_dir = vim.fn.expand("~/git")

    -- Command to find .git directories.
    -- -prune prevents traversing inside the .git directory itself to speed up the search.
    -- -maxdepth 4 prevents it from searching too deep (e.g., inside massive node_modules). Adjust as needed.
    local cmd = string.format("find %s -maxdepth 4 -name '.git' -type d -prune 2>/dev/null", base_dir)

    local handle = io.popen(cmd)
    if not handle then return {} end
    local result = handle:read("*a")
    handle:close()

    local repos = {}
    for git_dir in string.gmatch(result, "[^\r\n]+") do
        -- Strip the trailing '/.git' to get the actual repository path
        local repo_path = git_dir:gsub("/%.git$", "")
        table.insert(repos, repo_path)
    end

    return repos
end

local function project_picker(opts)
    opts = opts or {}
    local repos = get_git_repos()

    if #repos == 0 then
        vim.notify("No Git repositories found in ~/git", vim.log.levels.WARN)
        return
    end

    pickers.new(opts, {
        prompt_title = "Git Repositories (~/git)",
        finder = finders.new_table {
            results = repos,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)

                local selection = action_state.get_selected_entry()
                if selection then
                    vim.api.nvim_set_current_dir(selection.value)
                    vim.notify("Workspace changed to: " .. selection.value, vim.log.levels.INFO)
                end
            end)
            return true
        end,
    }):find()
end

-- Setup function to create the user command
local desc = "Search ~/git for repositories and set as workspace"
vim.api.nvim_create_user_command("GitProjects", project_picker, { desc = desc })

vim.keymap.set("n", "<C-M-p>", project_picker, { desc = desc })
