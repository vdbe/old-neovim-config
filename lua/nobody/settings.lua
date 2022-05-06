local opt = vim.opt  -- to set options
local prefix = vim.fn.stdpath('config')

table.insert(opt.path, "**")

opt.wildignore:prepend('*.o')
opt.wildignore:prepend('*.pyc')
opt.wildignore:prepend('*_build/*')
opt.wildignore:prepend('**/coverage/*')
opt.wildignore:prepend('**/node_modules/*')
opt.wildignore:prepend('**/android/*')
opt.wildignore:prepend('**/ios/*')
opt.wildignore:prepend('**/.git/*')

opt.compatible = false
opt.relativenumber = true
opt.hlsearch = false
opt.hidden = true
opt.errorbells = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.wrap = false
opt.swapfile = false
opt.directory = prefix .. '/swap'
opt.backup = false
opt.backupdir = prefix .. '/bakcup'
opt.undodir = prefix .. '/undo'
opt.undofile = true
opt.incsearch = true
opt.scrolloff = 8
opt.mouse = 'a'
opt.signcolumn = "yes"
opt.autochdir = true

-- Give more space for displaying message.
opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- Dont't pass messages to |ins-completion-menu|.
--opt.shortmess::append({ c = true })
vim.opt.shortmess:append({ c = true })

opt.colorcolumn = "80"

-- providers
vim.g.python3_host_prog = vim.fn.stdpath('config') .. '/python-env/bin/python'

