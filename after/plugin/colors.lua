Theme = ""

function SetColorTheme(theme)
    Theme = theme

	vim.cmd.colorscheme(theme)
end


SetColorTheme("dracula")
