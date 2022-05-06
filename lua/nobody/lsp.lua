local sumneko_root_path = vim.fn.expand("~/repos/lua-language-server")
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', { desc = "Show error/waring in popup", noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = "Goto prev error/waring", noremap = true, silent = false})
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = "Goto next error/waring", noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = "Add buffer diagnostics (errors/warnings) to the location list", noremap = true, silent = false})

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Default
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Go to declaration', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show hint for part under the cursor', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'Signature help', noremap = true, silent = false })
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { desc = '', noremap = true, silent = false })
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { desc = '', noremap = true, silent = false })
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { desc = '', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Go to type definition', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename reference under the cursor', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Select a code action available at the current cursor position', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'List all the refrences to the symbol under the cursor', noremap = true, silent = false })
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatg()<CR>', { desc = '', noremap = true, silent = false })

  -- Custom
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>bf', '<cmd>lua  vim.lsp.buf.format({async = true })<CR>', { desc = 'Format the current buffer', noremap = true, silent = true })
  vim.keymap.set({'n'}, "<leader>vws", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { desc = 'TODO:', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>Wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { desc = 'TODO:', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>Wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { desc = 'TODO:', noremap = true, silent = false })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>Wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { desc = 'TODO:', noremap = true, silent = false })
  vim.keymap.set({'i'}, "<C-h>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = 'Show signature help of the symbol under the cursor', noremap = true, silent = false })
end

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    on_attach = on_attach,
  }, _config or {})
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'rust_analyzer', 'tsserver' }
--for _, lsp in pairs(servers) do
--  require('lspconfig')[lsp].setup {
--    on_attach = on_attach,
--    flags = {
--      -- This will be the default in neovim 0.7+
--      debounce_text_changes = 150,
--    }
--  }
--end

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup(config())
lspconfig.pyright.setup(config({
    cmd = { vim.fn.stdpath('config') .. '/python-env/bin/pyright-langserver', "--stdio" },
}))
lspconfig.rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	--[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
}))


require("lspconfig").sumneko_lua.setup(config({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

local symbol_opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("symbols-outline").setup(symbol_opts)

