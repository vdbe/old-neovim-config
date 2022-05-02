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

-- Using Lua functions
local opts = { noremap=true, silent=true }

-- Search
vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)

-- Git
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>gT', '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', opts)

