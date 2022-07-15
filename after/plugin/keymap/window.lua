local nnoremap = require("nobody.keymap").nnoremap

-- Window navigation
nnoremap('<leader>ww', '<cmd>wincmd w<CR>')
nnoremap('<leader>wh', '<cmd>wincmd h<CR>')
nnoremap('<leader>wj', '<cmd>wincmd j<CR>')
nnoremap('<leader>wk', '<cmd>wincmd k<CR>')
nnoremap('<leader>wl', '<cmd>wincmd l<CR>')

-- Window movement
nnoremap('<leader>wr', '<cmd>wincmd r<CR>')
nnoremap('<leader>wR', '<cmd>wincmd R<CR>')
nnoremap('<leader>wx', '<cmd>wincmd x<CR>')
nnoremap('<leader>wH', '<cmd>wincmd H<CR>')
nnoremap('<leader>wJ', '<cmd>wincmd J<CR>')
nnoremap('<leader>wK', '<cmd>wincmd K<CR>')
nnoremap('<leader>wL', '<cmd>wincmd L<CR>')

-- Window spliting
nnoremap('<leader>wv', '<cmd>vsplit<CR>')
nnoremap('<leader>ws', '<cmd>split<CR>')

-- Buffer navigation
nnoremap('<leader>bl', '<cmd>e#<CR>')
nnoremap('<leader>bp', '<cmd>bprevious<CR>')
nnoremap('<leader>bn', '<cmd>bnext<CR>')
nnoremap('<leader>bd', '<cmd>bdelete<CR>')
