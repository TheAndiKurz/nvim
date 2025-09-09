local last_compile_command = ""

vim.api.nvim_create_user_command("Compile", function()
    local command = vim.fn.input("Compile command (" .. last_compile_command .. ") > ")

    if string.len(command) > 0 then
        last_compile_command = command
    end

    if string.len(last_compile_command) == 0 then
        return
    end

    vim.fn.setqflist({}, "r", { lines = vim.fn.systemlist(last_compile_command) })
    vim.cmd("cwindow")
end, {
  desc = "executes the command and puts the output into quickfix. it also remembers the last compile command if no arguments are passed. use :compiler to set the errorformat",
})
