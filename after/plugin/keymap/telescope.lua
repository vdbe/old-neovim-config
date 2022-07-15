local nnoremap = require("nobody.keymap").nnoremap

-- Search
nnoremap("<leader><leader>", require('nobody.telescope').project_files)
nnoremap("<leader>ps", require('nobody.telescope').project_live_grep)
nnoremap("<C-p>", require('telescope.builtin').git_files)
nnoremap("<Leader>df", require('telescope.builtin').find_files)
nnoremap("<Leader>ds", require("telescope.builtin").live_grep)
nnoremap("<leader>vh", require('telescope.builtin').help_tags)
nnoremap("<leader>vc", require('telescope.builtin').commands)
nnoremap("<leader>vp", require('telescope.builtin').pickers)

-- Git
nnoremap("<leader>gb", require('telescope.builtin').git_branches)
nnoremap("<leader>gt", require('telescope').extensions.git_worktree.git_worktrees)
nnoremap("<leader>gT", require('telescope').extensions.git_worktree.create_git_worktree)
nnoremap("<leader>gc", require('telescope.builtin').git_commits)

-- Tree-sitter
nnoremap("<leader>s", require('telescope.builtin').treesitter)
