local f = require("feline")

local components = {
    active = {},
    inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Component that shows Vi mode with highlight
components.active[1][1] = {
    provider = 'vi_mode',
    hl = function()
        return {
            name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            fg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold'
        }
    end,
    right_sep = ' '
}

-- Component that shows file info
components.active[1][2] = {
    provider = 'file_info',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {' ', 'slant_left_2'},
    right_sep = {'slant_right_2', ' '},
    -- Uncomment the next line to disable file icons
    -- icon = ''
}

-- Component that shows current file size
components.active[1][3] = {
    provider = 'file_size',
    right_sep = {
        ' ',
        {
            str = 'slant_left_2_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        },
        ' '
    }
}

-- Component that shows file encoding
components.active[2][1] = {
    provider = 'file_encoding'
}

-- Component that shows current git branch
components.active[3][1] = {
    provider = 'git_branch',
    hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold'
    },
    right_sep = {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'black'
        }
    }
}

f.setup()

