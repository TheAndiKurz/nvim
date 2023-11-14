Theme = ""

function SetColorTheme(theme)
    Theme = theme

	vim.cmd.colorscheme(theme)
end


-- ColorMyPencils("ayu")
SetColorTheme("rose-pine")
