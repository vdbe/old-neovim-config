require('catppuccin').setup({
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    transparent_background = false,
    term_colors = false,
    compile = {
        enabled = true,
        path = vim.fn.stdpath "cache" .. "/catppuccin",
        suffix = "_compiled"
        },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        coc_nvim = false,
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = false,
            show_root = true,
            transparent_panel = false,
        },
        neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = true,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
        hop = false,
        notify = true,
        telekasten = true,
        symbols_outline = true,
        mini = false,
    }
})

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
