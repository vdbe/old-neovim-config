local nnoremap = require("nobody.keymap").nnoremap

require("nvim-tree").setup()
nnoremap("<leader>of", require("nvim-tree").toggle)
