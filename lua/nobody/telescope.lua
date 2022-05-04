require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    color_devicons = true,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    },
  }
}

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")

-- Search
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { desc = 'Find files in the current working directory', noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { desc = 'Live grep in the current working directory', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { desc = 'Find open buffer', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { desc = 'Search in the vim help files',  noremap = true, silent = true })

-- Git
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', { desc = 'Change git branch', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', { desc = 'Change git working tree', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gT', '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', { desc = 'delete git working tree', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', { desc = 'Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gC', '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', { desc = 'Lists buffer\'s git commits with diff preview and checks them out on <cr>', noremap = true, silent = true })

-- tree-sitter
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>lua require("telescope.builtin").treesitter()<cr>', { desc = 'Lists Function names, variables, from Treesitter', noremap = true, silent = true })

-- Keymap help
vim.api.nvim_set_keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', { desc = 'Lists normal mode keymappings', noremap = true, silent = true })

