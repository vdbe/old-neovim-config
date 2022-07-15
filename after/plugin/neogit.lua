local nnoremap = require('nobody.keymap').nnoremap

nnoremap("<leader>gs", require('neogit').open)


nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
