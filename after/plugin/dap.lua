local dap = require "dap"
local ui = require "dapui"


ui.setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup()


vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

vim.keymap.set("n", "<leader>dh", function ()
    ui.eval(nil, { enter = true })
end)

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>ds", dap.step_into)
vim.keymap.set("n", "<leader>dn", dap.step_over)
vim.keymap.set("n", "<leader>do", dap.step_out)
vim.keymap.set("n", "<leader>ddb", dap.step_back)
vim.keymap.set("n", "<leader>ddr", dap.restart)


dap.listeners.before.attach.dapui_config = function ()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function ()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function ()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function ()
    ui.close()
end
