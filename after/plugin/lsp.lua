local Remap = require("nobody.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

require("nvim-lsp-installer").setup({
    ensure_installed = { "sumneko_lua" }
})

vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    --float = {
    --    focusable = false,
    --    style = "minimal",
    --    border = "rounded",
    --    source = "always",
    --    header = "",
    --    prefix = "",
    --},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
    return vim.tbl_deep_extend("force", {
        -- Enable completion triggered by <c-x><c-o>

        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function(client, bufnr)
            print('LSP attached')

            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            nnoremap("gd", vim.lsp.buf.definition)
            nnoremap("gD", vim.lsp.buf.declaration)
            nnoremap("K", vim.lsp.buf.hover)
            nnoremap("<leader>vws", vim.lsp.buf.workspace_symbol)
            nnoremap("<leader>vca", vim.lsp.buf.code_action)
            nnoremap("<leader>vrr", vim.lsp.buf.references)
            nnoremap("<leader>vrn", vim.lsp.buf.rename)
            nnoremap("<leader>bf", vim.lsp.buf.format)
            inoremap("<C-h>", vim.lsp.buf.signature_help)
        end,
    }, _config or {})
end

local lspconfig = require("lspconfig");
lspconfig.tsserver.setup(config())
lspconfig.jsonls.setup(config())
lspconfig.ansiblels.setup(config())
lspconfig.tailwindcss.setup(config())
lspconfig.prismals.setup(config())

lspconfig.yamlls.setup(config({
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            }
        }
    },
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

lspconfig.sumneko_lua.setup(config({
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
