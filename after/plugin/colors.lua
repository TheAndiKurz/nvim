Theme = ""

function SetColorTheme(theme)
    Theme = theme

	vim.cmd.colorscheme(theme)
end


-- SetColorTheme("rose-pine")
SetColorTheme("gruvbox")
