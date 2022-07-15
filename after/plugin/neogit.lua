local nnoremap = require('nobody.keymap').nnoremap

nnoremap("<leader>gg", require('neogit').open)


nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
