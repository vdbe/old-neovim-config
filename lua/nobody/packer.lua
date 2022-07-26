return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("TimUntersberger/neogit")
    use("ThePrimeagen/git-worktree.nvim")
    use("lewis6991/gitsigns.nvim")

    use("sbdchd/neoformat")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    --use("gruvbox-community/gruvbox")
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    --use({ "~/projects/lualine.nvim", as = "lualine" });

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use("kylechui/nvim-surround")

    use("SmiteshP/nvim-navic")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-calc")
    use("hrsh7th/cmp-cmdline")
    use("ray-x/cmp-treesitter")
    use("f3fora/cmp-spell")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("williamboman/nvim-lsp-installer")
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    use("simrat39/symbols-outline.nvim")

    use({"akinsho/toggleterm.nvim", tag = 'v2.*'})

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("romgrk/nvim-treesitter-context")
    use("p00f/nvim-ts-rainbow")
    use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
end)
