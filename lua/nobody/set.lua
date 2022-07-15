local prefix = vim.fn.stdpath('config')

vim.g.root_dir = vim.env.PWD

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.directory = prefix .. '/swap'
vim.opt.backup = false
vim.opt.backupdir = prefix .. '/bakcup'
vim.opt.undodir = prefix .. '/undo'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.mouse = 'a'

vim.opt.autochdir = true

-- Give more space for displaying message.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Dont't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })

vim.opt.colorcolumn = "80"
