local navic = require("nvim-navic")
vim.g.navic_silence = true
local l = require('lualine');

require('lualine').setup({
    sections = {
        lualine_c = {
            { 'filename' },
            { navic.get_location, cond = navic.is_available },
        }
    },
})
