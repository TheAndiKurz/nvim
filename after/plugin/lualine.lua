local lualine = require("lualine")

function SetupLuaLine()
    lualine.setup {
        options = {
            icons_enabled = true,
            theme = Theme,
            component_seperators = "|",
            section_separators = "",
        },
    }
end

SetupLuaLine()
