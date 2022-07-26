local Remap = require("nobody.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
--local inoremap = Remap.inoremap
--local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Exit to normal mode with jk
vim.keymap.set({'!'}, 'jk', [[<c-\><c-n>]], {})
vim.keymap.set({'t'}, 'jk', [[<c-\><c-n>]], {})

-- Move lines in visual mode with J/K
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")
