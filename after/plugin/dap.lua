local dap = require "dap"
local ui = require "dapui"

local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"

ui.setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup()

dap.adapters.codelldb = {
  type = "server",
  port = "13299",
  host = "127.0.0.1",
  executable = {
  command = bin_locations .. "codelldb",
  args = { "--port", "13299" },
  },
}

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.zig = {
    {
        name = "Run Program",
        type = "codelldb",
        request = "launch",
        program = function()
            co = coroutine.running()
            if co then
                cb = function(item)
                    coroutine.resume(co, item)
                end
            end
            cb = vim.schedule_wrap(cb)
            vim.ui.select(vim.fn.glob(vim.fn.getcwd() .. '**/zig-out/**/*', false, true), {
                    prompt = "Select executable",
                    kind = "file",
                },
                cb)
            return coroutine.yield()
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
        end,
    }
}


vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

vim.keymap.set("n", "<leader>dh", function()
    ui.eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F7>", dap.step_back)
vim.keymap.set("n", "<F8>", dap.step_into)
vim.keymap.set("n", "<F9>", dap.step_out)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.restart)

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
