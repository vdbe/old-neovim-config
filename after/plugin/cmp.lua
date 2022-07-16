local cmp = require("cmp")


local source_name_map = {
    nvim_lsp      = '[LSP]',
    ultisnips     = '[Snip]',
    buffer        = '[Buf]',
    treesitter    = '[TS]',
    path          = '[Path]',
    spell         = '[Spell]',
    tags          = '[Tags]',
    nvim_lua      = '[Lua]',
    latex_symbols = '[Latex]',
    cmdline       = '[Cmd]',
    luasnip       = '[Snip]',
    emoji         = '[Emoji]',
    zsh           = '[Zsh]',
}

local comp_items = {
    -- if you change or add symbol here
    -- replace corresponding line in readme
    Text           = ' ',
    -- Text        = ' ',
    -- Method      = '',
    -- Method      = '',
    Method         = ' ',
    Function       = ' ',
    -- Constructor = '',
    Constructor    = ' ',
    Field          = 'ﰠ ',
    Variable       = ' ',
    Class          = 'ﴯ ',
    Interface      = ' ',
    Module         = ' ',
    -- Property    = 'ﰠ',
    Property       = '',
    Unit           = ' 塞',
    Value          = ' ',
    -- Enum        = '',
    Enum           = '了 ',
    -- Keyword     = '',
    Keyword        = ' ',
    -- Snippet     = '',
    Snippet        = ' ',
    Color          = ' ',
    File           = ' ',
    Reference      = ' ',
    Folder         = ' ',
    EnumMember     = '',
    -- Constant    = '',
    Constant       = ' ',
    Struct         = 'פּ ',
    Event          = ' ',
    Operator       = ' ',
    TypeParameter  = '  '
}

local comp_items_text = {
    Text          = 'Text',
    Method        = 'Meth',
    Function      = 'Func',
    Constructor   = 'Constructor',
    Field         = 'Field',
    Variable      = 'Var',
    Class         = 'Cls',
    Interface     = 'Interface',
    Module        = 'Mod',
    Property      = 'Prop',
    Unit          = 'Unit',
    Value         = 'Value',
    Enum          = 'Enum',
    Keyword       = 'KeyW',
    Snippet       = 'Snip',
    Color         = 'Color',
    File          = 'File',
    Reference     = 'Ref',
    Folder        = 'Folder',
    EnumMember    = 'EnumMember',
    Constant      = 'Const',
    Struct        = 'Struct',
    Event         = 'Event',
    Operator      = 'Oper',
    TypeParameter = 'TypeParam',
}

--local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--end

local luasnip = require("luasnip")

cmp.setup({
    -- enabled = function(args)
    --     -- print("args:", args)
    --     -- print("bufftype:", vim.api.nvim_buf_get_option(0, 'buftype'))
    --     -- print("bufftype?:", vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt')
    --     return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
    -- end,
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            --elseif has_words_before() then
            --    cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        --['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's', 'c' }),
        --['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's', 'c' }),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        -- ['<Tab>'] = cmp.mapping.select_next_item({
        --     behavior = cmp.SelectBehavior.Select,
        --     select = true,
        -- }),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item({
        --     behavior = cmp.SelectBehavior.Select,
        --     select = true,
        -- }),
    }),

    formatting = {
        format = function(entry, vim_item)
            if vim_item.abbr then
                vim_item.abbr = comp_items[vim_item.kind] .. "" .. vim_item.abbr
            end

            -- vim_item.kind = comp_items_text[k]
            vim_item.kind = comp_items_text[vim_item.kind]

            -- set a name for each source
            vim_item.menu = source_name_map[entry.source.name]

            -- vim_item.kind = comp_items[vim_item.kind] .. " | " .. entry.source.name
            -- for k, v in pairs(vim_item) do
            --     print(k, v)
            -- end

            return vim_item
        end
    },
    sources = {
        -- For ultisnips user.
        -- { name = 'nvim_lsp', group_index = 1 },
        -- { name = 'nvim_lsp_signature_help', group_index = 1 },
        -- --{ name = 'ultisnips', group_index = 1 },
        -- { name = "luasnip", group_index = 1 },
        -- { name = 'treesitter', group_index = 1 },
        -- { name = 'buffer', group_index = 1, Keyword_length = 3  },
        -- { name = 'tags', group_index = 1 },
        -- { name = 'nvim_lua', group_index = 1 },
        -- { name = 'path', group_index = 1 },
        -- { name = 'spell', group_index = 2 },
        -- { name = 'calc', group_index = 2 },
        -- { name = 'zsh', group_index = 2 },
        -- { name = 'emoji', group_index = 2 },

        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        --{ name = 'ultisnips' },
        { name = "luasnip" },
        { name = 'treesitter' },
        { name = 'buffer' },
        { name = 'tags' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'spell' },
        { name = 'calc' },
        { name = 'zsh' },
        { name = 'emoji' },
    },

    --window = {
    --    documentation = {
    --        -- border b_top , b_right , b_bot , b_left , b_topleft , b_topright , b_botright , b_botleft
    --        -- border = { '', '', '', ' ', '', '', '', ' ' },
    --        -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
    --        border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    --    },
    --},

    -- experimental = {
    -- 	ghost_text = true,
    -- },
})

-- https://github.com/hrsh7th/cmp-cmdline
-- START --
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    {
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    }
    )
})
