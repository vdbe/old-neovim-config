-- Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- https://github.com/nanotee/nvim-lua-guide#api-functions
vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {})


-- Window navigation
vim.keymap.set({'n'}, '<leader>ww', '<cmd>wincmd w<CR>', {})
vim.keymap.set({'n'}, '<leader>wh', '<cmd>wincmd h<CR>', {})
vim.keymap.set({'n'}, '<leader>wj', '<cmd>wincmd j<CR>', {})
vim.keymap.set({'n'}, '<leader>wk', '<cmd>wincmd k<CR>', {})
vim.keymap.set({'n'}, '<leader>wl', '<cmd>wincmd l<CR>', {})

-- Window movement
vim.keymap.set({'n'}, '<leader>wr', '<cmd>wincmd r<CR>', {})
vim.keymap.set({'n'}, '<leader>wR', '<cmd>wincmd R<CR>', {})
vim.keymap.set({'n'}, '<leader>wx', '<cmd>wincmd x<CR>', {})
vim.keymap.set({'n'}, '<leader>wH', '<cmd>wincmd H<CR>', {})
vim.keymap.set({'n'}, '<leader>wJ', '<cmd>wincmd J<CR>', {})
vim.keymap.set({'n'}, '<leader>wK', '<cmd>wincmd K<CR>', {})
vim.keymap.set({'n'}, '<leader>wL', '<cmd>wincmd L<CR>', {})

-- Window spliting
vim.keymap.set({'n'}, '<leader>wv', '<cmd>vsplit<CR>', {})
vim.keymap.set({'n'}, '<leader>ws', '<cmd>split<CR>', {})

-- Buffer navigation
vim.keymap.set({'n'}, '<leader>bl', '<cmd>e#<CR>', {})
vim.keymap.set({'n'}, '<leader>bp', '<cmd>bprevious<CR>', {})
vim.keymap.set({'n'}, '<leader>bn', '<cmd>bnext<CR>', {})
vim.keymap.set({'n'}, '<leader>bd', '<cmd>bdelete<CR>', {})
