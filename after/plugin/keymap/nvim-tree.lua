local nnoremap = require("nobody.keymap").nnoremap

require("nvim-tree").setup()
nnoremap("<leader>tf", require("nvim-tree").toggle)
